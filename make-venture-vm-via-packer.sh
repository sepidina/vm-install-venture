# import settings
source ./settings.sh


# Ensure the base VM is present
make base-vm
abort_on_error "make base-vm"

# If a VM with the name we want already exists, assume it is dirty and
# get rid of it
VBoxManage list runningvms | grep -q $vmname
if [[ $? -eq "0" ]]; then
    VBoxManage controlvm $vmname poweroff
    sleep 10 # How long is enough time?
fi

VBoxManage list vms | grep -q $vmname
if [[ $? -eq "0" ]]; then
    echo "Unregistering extant VM named ${vmname}."
    VBoxManage unregistervm $vmname --delete
    abort_on_error "Unregistering extant VM named ${vmname}."
fi

# Import the base VM into VitrualBox
# must be NAT on VM creation
# must specify not to change nat mac; else mac changes, eth0 doesn't come up and can't get back in via ssh
VBoxManage import "base-vm/${project_name}.ovf" --options keepnatmacs
abort_on_error "Importing base-vm/${project_name}.ovf into virtualbox"

# Boot it
VBoxManage startvm "${project_name}" --type headless
abort_on_error "Starting the ${project_name} VM"

# Install Venture in it
bash install-venture-into-vm.sh
abort_on_error "Intalling Venture into the ${vmname} VM.  The VM is still running."

# Shut it down
ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost "echo $password | sudo -S -p '' halt"
abort_on_error "Issuing a shutdown command to the ${vmname} VM"
sleep 30 # Is this enough time for the thing to shut down properly?
VBoxManage controlvm "${vmname}" poweroff
abort_on_error "Powering the ${vmname} VM off"

# Export it
VBoxManage export "${vmname}" --output $ovf_full_path
abort_on_error "Exporting the ${vmname} VM to ${ovf_full_path}."

# Get rid of it
VBoxManage unregistervm "${vmname}" --delete
warn_on_error "Unregistering the ${vmname} VM."

# Package up for uploading
bash create_tgz.sh $project_name
abort_on_error "Building a tarball to upload."

# # import and connect
# bash import_boot_connect.sh $project_name
