base-vm: ubuntu-12.04.2-server-preseed.cfg vbox_ubuntu-12.04.2-server-amd64_packer_config.json guest-script/set-up-ssh-key.sh guest-script/provision-dependencies.sh guest-script/disk-cleanup.sh
	bash make-base-vm-via-packer.sh
