Import/run instructions for Prebuilt Venture Virtual Machine
============================================================

Venture is an interactive, Turing-complete probabilistic programming
platform that aims to be sufficiently expressive, extensible, and
efficient for general-purpose use.

http://probcomp.csail.mit.edu/venture/

Venture is **alpha quality** software.  We are proud of the underlying
engine and the ideas it embodies, but we have not sanded off its many
rough edges.

Be advised that this release is for early adopter types who are
willing to put up with much of the pain that a more mature software
package would not impose.  In particular, documentation is sparse and
the user interface is unforgiving.  Often, the only way to learn
what's going on will be to ask us or to read the source code.

## Overview

After downloading the VM, working with the VM for the first time requires

1. Uncompressing the VM

1. Importing the VM

1. Starting the VM

1. Logging into the VM

1. Using Venture inside the VM

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

### Using Venture

Start a terminal inside the VM.

-   Interactive Venture console:

        venture

    You might like to type in the [trick coin
    example](http://probcomp.csail.mit.edu/venture/console-tutorial.html)
    to start getting a feel for Venture.

-   Venture as a library in Python:

        python -i -c 'from venture import shortcuts; ripl = shortcuts.make_church_prime_ripl()'

    Using Venture as a library allows you to drive it
    programmatically.  You might like to peruse the
    [tutorial](http://probcomp.csail.mit.edu/venture/library-tutorial.html)
    (included in the VM as `~/Venturecxx/hello_venture.html`) for inspiration.

-   You can find two advanced examples in the `~Venturecxx/examples/`
    directory.  These rely on VentureUnit (included), an experimental
    inference visualization wrapper using Venture as a library.

## Other operations

**NOTE**: The VM is only meant to provide an out-of-the-box usable
system setup.  Its resources are limited and large jobs will cause
memory errors.  To run larger jobs, increase the VM resources or
install directly to your system.

### Loggin in via SSH

You can log in to the VM via ssh with (tested on Ubuntu and Mac OSX)

> ssh-keygen -f ~/.ssh/known_hosts -R [localhost]:2222

> ssh -i vm_guest_id_rsa -p 2222 -o StrictHostKeyChecking=no venture@localhost

### Getting the source

Source for Venture is included in the VM in `~/Venturecxx/`.  See the
README therein for a little orientation.

You can also download the source from [our web
site](http://probcomp.csail.mit.edu/venture/)
