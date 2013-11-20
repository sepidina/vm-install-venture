# Import settings
source ./settings.sh


if [[ ! -d $project_dir ]]; then
	echo "$0: project_dir doesn't exist: $project_dir"
	exit
fi


cd $project_dir
cp ../$rsa_key_filename .
cp ../VM_README.md .
tar cvfz ../$tarball *
