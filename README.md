VM Install Venture
==================

A blob of code for building VMs with Venture preinstalled.

## Install dependencies

    sudo apt-get install virtualbox qemu-utils

The [packer](http://www.packer.io/) tool is not packaged under Ubuntu,
so you need to install it manually.  One way to do this _on amd64_ is to use the
provided script:

    bash install-packer.sh
    source ~/.bashrc

## Create a VM
    bash make-venture-vm-via-packer.sh

This will produce a VM in the `venture-vm-virtualbox`
directory, and a suitably named tarball containing it.

## Some tools for manual manipulations

### Import to VirtualBox, boot and connect

    bash import-boot-connect.sh

Note that if you modify the VM, you may wish to re-export it from
VirtualBox (see the source of `import-boot-connect.sh`).

### Self-check the VM

    bash validate-built-vm.sh

### Package the VM 

    bash create-tgz.sh
