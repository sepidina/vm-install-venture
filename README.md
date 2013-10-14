vm-install-archetype
====================

# get it
    install_dir=<INSTALL_DIR>
    git clone https://github.com/mit-probabilistic-computing-project/vm-install-archetype $install_dir
    sudo bash $install_dir/install.sh
    source ~/.bashrc

# create a VM
    bash $install_dir/create_vm_via_packer.sh $install_dir/vbox_ubuntu-12.04.2-server-amd64_packer_config.json

# import to virtualbox, boot and connect
    # assume default output_directory an vm_name were used
    # you will be prompted for login to VM via ssh
    bash $install_dir/import_boot_connect.sh output-virtualbox packer-virtualbox
