VM Install Venture
==================

A blob of code for building VMs with Venture preinstalled.

## Install dependencies

    sudo apt-get install virtualbox qemu-utils

The [packer](http://www.packer.io/) tool is not packaged under Ubuntu,
so you need to install it manually.  One way to do this _on amd64_ is to use the
provided script:

    bash vm-install-venture/install-packer.sh
    source ~/.bashrc

## Create a VM
    bash complete_create_vm_via_packer.sh

This will produce a VM in the `vm-install-venture-virtualbox`
directory, and a suitably named tarball containing it.

## Import to VirtualBox, boot and connect
    bash import_boot_connect.sh
