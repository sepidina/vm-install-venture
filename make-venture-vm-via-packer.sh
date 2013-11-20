# import settings
source ./settings.sh


# Ensure the base VM is present
make base-vm
if [[ $? -ne "0" ]]; then
	echo FAILED: make base-vm
	exit 1
fi

# Copy it into the working location
rm -rf $project_dir
cp -r base-vm $project_dir

# Import it into VitrualBox
# must be NAT on VM creation
# must specify not to change nat mac; else mac changes, eth0 doesn't come up and can't get back in via ssh
VBoxManage import $ovf_full_path --options keepnatmacs

# Boot it
VBoxManage startvm "${project_name}" --type headless

# Install Venture in it
bash install-venture-into-vm.sh

# Package up for uploading
bash create_tgz.sh $project_name

# # import and connect
# bash import_boot_connect.sh $project_name
