# Import settings
source ./settings.sh

vmpath=$project_dir
# Parse input arguments
if [[ ! -z $1 ]]; then
    vmpath=$1
fi
if [[ ! -z $2 ]]; then
    vmname=$2
fi

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
VBoxManage import "${vmpath}/${project_name}.ovf" --options keepnatmacs
abort_on_error "Importing ${vmpath}/${project_name}.ovf into virtualbox"

# Boot it
VBoxManage startvm "${vmname}" --type headless
abort_on_error "Starting the ${vmname} VM"
