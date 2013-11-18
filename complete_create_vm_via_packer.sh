# import settings
source ./settings.sh


# clone Venturecxx for copy
rm -rf Venturecxx # In case it was there before
git clone git@github.com:mit-probabilistic-computing-project/Venturecxx.git
# or
# git clone https://github.com/mit-probabilistic-computing-project/Venturecxx
# if you prefer
if [[ ! -d Venturecxx ]]; then
	echo "$0: need Venturecxx cloned to copy into VM"
	exit
fi


# ensure key files exist
if [[ ! -f $packer_config_filename ]]; then
	echo "$0: packer_config_filename doesn't exist: $packer_config_filename"
	exit
fi


# build!
bash create_vm_via_packer.sh
if [[ $? -ne "0" ]]; then
	echo FAILED: bash create_vm_via_packer.sh $packer_config_filename
	exit
fi


# package up for uploading
bash create_tgz.sh $project_name


# # import and connect
# bash import_boot_connect.sh $project_name
