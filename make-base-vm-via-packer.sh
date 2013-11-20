rsa_key_filename=vm_guest_id_rsa

packer_config_filename=vbox_ubuntu-12.04.2-server-amd64_packer_config.json
username=$(grep '^d-i passwd/username string' ubuntu-12.04.2-server-preseed.cfg | awk '{print $NF}')

echo "Starting Packer build of VM"
echo `date`

# Packer presumes paths in config are relative to working directory,
# so cd to config filename location
config_abs_path=$(readlink -f "$packer_config_filename")
config_abs_dir=$(dirname $config_abs_path)
cd $config_abs_dir

# Ensure config file exists
if [[ ! -f $packer_config_filename ]]; then
	echo "$0: packer_config_filename doesn't exist: $packer_config_filename"
	exit 1
fi

# Validate config
packer validate -var "userpass=$username" $packer_config_filename
if [[ $? -ne "0" ]]; then
    echo FAILED: "Validating ${packer_config_filename}."
    exit 1
fi

# Create $keyfile and $keyfile.pub
rm -rf $rsa_key_filename
ssh-keygen -t rsa -P "" -f $rsa_key_filename

# Build the VM
set -o pipefail # Preserve exit status of packer, per http://stackoverflow.com/questions/6871859/piping-command-output-to-tee-but-also-save-exit-code-of-command
PACKER_LOG=1 packer build -var "userpass=$username" $packer_config_filename 2>err | tee out 
if [[ $? -ne 0 ]]; then
	echo "FAILED: Building ${packer_config_filename}."
        echo "Packer output copied in 'out'; standard error in 'err'"
	exit 1
fi

echo "Done Packer build of VM"
echo `date`
