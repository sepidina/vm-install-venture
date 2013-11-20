# Import settings
source ./settings.sh

# Ensure the base VM is present
make base-vm
abort_on_error "make base-vm"

bash import-boot.sh base-vm
abort_on_error "Importing and booting the base VM."

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
rm -rf $project_dir
mkdir -p $project_dir
VBoxManage export "${vmname}" --output $ovf_full_path
abort_on_error "Exporting the ${vmname} VM to ${ovf_full_path}."

# Get rid of it
VBoxManage unregistervm "${vmname}" --delete
warn_on_error "Unregistering the ${vmname} VM."

bash validate-built-vm.sh
abort_on_error "Validating the built VM."

# Package up for uploading
bash create-tgz.sh $project_name
abort_on_error "Building a tarball to upload."

# # import and connect
# bash import-boot-connect.sh
