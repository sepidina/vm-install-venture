# get non C++11 system dependencies
# MUST install these BEFORE gcc/g++ 4.8 install
sudo apt-get install -y libboost1.48-all-dev libgsl0-dev cmake make git

# get C++11
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y gcc-4.8 g++-4.8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50

# get and build venture
# git clone https://github.com/mit-probabilistic-computing-project/venturelite
# cd venturelite && git checkout cxx
# cmake . && make
