Import/run instructions for Prebuilt Venture Virtual Machine
============================================================

## Overview

After downloading the VM, working with the VM for the first time requires

1. Uncompressing the VM

1. Importing the VM

1. Starting the VM

1. Logging into the VM

### Uncompressing the VM

- Mac: double click the tgz file

- Linux: right click the tgz file, select extract here

### Importing the VM

- double click the extracted ovf file

- click import in the VirtualBox GUI

See [VirtualBox Manual](https://www.virtualbox.org/manual/ch01.html#ovf) for more info

### Starting the VM

- click Start in the VirtualBox GUI

### Logging into the VM

At the prompt in the VM GUI

- login/username: venture

- password: venture

## Other operations

**NOTE**: The VM is only meant to provide an out-of-the-box usable system setup.  Its resources are limited and large jobs will cause memory errors.  To run larger jobs, increase the VM resources or install directly to your system.

### Log in via SSH

You can log in to the VM via ssh with (tested on Ubuntu and Mac OSX)

> ssh-keygen -f ~/.ssh/known_hosts -R [localhost]:2222

> ssh -i vm_guest_id_rsa -p 2222 -o StrictHostKeyChecking=no venture@localhost
