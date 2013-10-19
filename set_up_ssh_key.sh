if [[ -z $kefile ]]; then
	echo "USAGE: bash set_up_ssh_key.sh KEYFILE"
	exit
fi


mkdir ~/.ssh
cat $keyfile >> ~/.ssh/authorized_keys
rm $keyfile
