# get non C++11 system dependencies
# MUST install these BEFORE gcc/g++ 4.8 install
sudo apt-get update
sudo apt-get build-dep -y python-numpy python-matplotlib
sudo apt-get install -y libboost1.48-all-dev libgsl0-dev cmake make git python-pip python-virtualenv ccache
# must update distribute before requirements.txt install
sudo pip install -U distribute

# get C++11
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y gcc-4.8 g++-4.8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 50
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 50

# get and build venture
# git clone https://github.com/mit-probabilistic-computing-project/Venturecxx
#cd Venturecxx
# # this fails: git complains about conflicts
#git checkout release_v0.1
#bash script/release-tarball
#cd ..
#rm -rf Venturecxx
#tar --extract --gunzip --file venture-0.1.tgz
#cd Venturecxx
#sudo pip install -r requirements.txt
#python setup.py install

