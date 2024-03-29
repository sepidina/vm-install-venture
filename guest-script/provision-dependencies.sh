# get non C++11 system dependencies
# MUST install these BEFORE gcc/g++ 4.8 install
sudo apt-get update && \
sudo apt-get install -y libboost1.48-all-dev libgsl0-dev cmake make git python-pip python-virtualenv ccache && \
# must update distribute before requirements.txt install
sudo pip install -U distribute && \

# get C++11
sudo apt-get install -y python-software-properties && \
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
sudo apt-get update && \
sudo apt-get install -y gcc-4.8 g++-4.8 && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50 && \
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50

# Python dependencies
sudo apt-get install -y python-pyparsing python-flask python-requests python-numpy python-matplotlib
