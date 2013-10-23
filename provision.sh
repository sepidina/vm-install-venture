apt-get install -y htop nmon tmux screen
apt-get install -y git ack-grep
apt-get install -y --force-yes vim-nox

rm /home/bigdata/VBoxGuestAdditions.iso
apt-get clean
dd if=/dev/zero of=fillfile bs=1M || echo
