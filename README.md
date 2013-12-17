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
VirtualBox using `vboxmanage export`.

### Self-check the VM

    bash validate-built-vm.sh

### Package the VM 

    bash create-tgz.sh

## A note on the architecture

The build process embodied here is separated into two stages:

- Create and cache a base VM provisioned with dependencies of Venture.

- Create a new VM from the base VM by loading and compiling Venture
  source into it.

The reason for the separation is that provisioning all the software
that Venture depends upon is slow but reliable, whereas building
Venture itself is comparatively faster and more error-prone.  The idea
is that by caching the base VM, we can cut down the time it takes to
build a VM with a new version of Venture prebuilt on it.
