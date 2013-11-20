if [[ -z $keyfile ]]; then
	if [[ -z $1 ]]; then
		echo "USAGE: bash set-up-ssh-key.sh KEYFILE"
		exit
	fi
	keyfile=$1
fi


mkdir ~/.ssh
cat $keyfile >> ~/.ssh/authorized_keys
rm $keyfile
