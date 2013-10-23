# import settings
source ./settings.sh


# parse input arguments
if [[ ! -z $1 ]]; then
	project_name=$1
fi
if [[ ! -z $2 ]]; then
	project_dir=$2
fi
if [[ ! -z $3 ]]; then
	port_number=$3
fi
if [[ ! -z $4 ]]; then
	username=$4
fi


# ensure key files exist
if [[ ! -f $ovf_full_path ]]; then
	echo "import_boot_connect.sh: ovf file doesn't exist: $ovf_full_path"
	exit
fi
if [[ ! -f $rsa_key_filename ]]; then
	echo "import_boot_connect.sh: rsa key file doesn't exist: $rsa_key_filename"
	exit
fi


# must be NAT on VM creation
# must specify not to change nat mac; else mac changes, eth0 doesn't come up and can't get back in via ssh
VBoxManage import $ovf_full_path --options keepnatmacs


# start VM; remove '--type headless' to use gui
VBoxManage startvm "${project_name}" --type headless


# connect
ssh-keygen -f ~/.ssh/known_hosts -R [localhost]:$port_number
ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost


# see VM info
# VBoxManage showvminfo "${vmname}"

# to power off
# VBoxManage controlvm "${vmname}" poweroff

# to remove (must be powered off)
# VBoxManage unregistervm "${vmname}" --delete
