# The VM needs to be running for this to work

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

# Build the release tarball
cd Venturecxx
git checkout release_v0.1
script/release-tarball
cd ..

# Upload it to the VM
scp -i $rsa_key_filename -P $port_number -o StrictHostKeyChecking=no venture-0.1.tgz $username@localhost:~/

# Upload and run the install script
scp -i $rsa_key_filename -P $port_number -o StrictHostKeyChecking=no install-venture.sh $username@localhost:~/
ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost bash install-venture.sh
