# import settings
source ./settings.sh

# ensure key files exist
if [[ ! -f $ovf_full_path ]]; then
	echo "import_boot_connect.sh: ovf file doesn't exist: $ovf_full_path"
	exit 1
fi
if [[ ! -f $rsa_key_filename ]]; then
	echo "import_boot_connect.sh: rsa key file doesn't exist: $rsa_key_filename"
	exit 1
fi

bash import-boot.sh

# connect
ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost


# see VM info
# VBoxManage showvminfo "${vmname}"

# to power off
# VBoxManage controlvm "${vmname}" poweroff

# to remove (must be powered off)
# VBoxManage unregistervm "${vmname}" --delete
