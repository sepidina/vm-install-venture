# The VM needs to be running for this to work

# import settings
source ./settings.sh

# clone Venturecxx for copy
rm -rf Venturecxx # In case it was there before
git clone git@github.com:mit-probabilistic-computing-project/Venturecxx.git
# or
# git clone https://github.com/mit-probabilistic-computing-project/Venturecxx
# if you prefer
abort_on_error "Cloning Venturecxx from github."

if [[ ! -d Venturecxx ]]; then
	echo "$0: need Venturecxx cloned to copy into VM"
	exit 1
fi

# Build the release tarball
cd Venturecxx
git checkout release_v0.1
abort_on_error "Checking out the release_v0.1 branch."
script/release-tarball
abort_on_error "Building the release tarball."
cd ..

# Upload it to the VM
scp -i $rsa_key_filename -P $port_number -o StrictHostKeyChecking=no venture-0.1.tgz $username@localhost:~/
abort_on_error "Uploading the release tarball into the VM at ${username}@localhost:${port_number}."

# Upload and run the install script
scp -i $rsa_key_filename -P $port_number -o StrictHostKeyChecking=no guest-script/install-venture.sh $username@localhost:~/
abort_on_error "Uploading the install-venture script into the VM at ${username}@localhost:${port_number}."
ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost bash install-venture.sh
abort_on_error "Executing the install-venture script in the VM at ${username}@localhost:${port_number}."
ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost rm install-venture.sh
abort_on_error "Cleaning the install-venture script from the VM at ${username}@localhost:${port_number}."

# Put in the VM_README.md
scp -i $rsa_key_filename -P $port_number -o StrictHostKeyChecking=no VM_README.md $username@localhost:~/
abort_on_error "Uploading the VM_README into the VM at ${username}@localhost:${port_number}."
