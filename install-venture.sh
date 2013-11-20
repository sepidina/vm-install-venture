# If the repo were public, could just clone it
# git clone https://github.com/mit-probabilistic-computing-project/Venturecxx
# cd Venturecxx
# git checkout release_v0.1
# cd ..

if [[ -f venture-0.1.tgz ]]; then
    tar --extract --gunzip --file venture-*.tgz
fi

# Build Venture
cd Venturecxx
echo "venture" | sudo -S pip install -r requirements.txt
echo "venture" | sudo -S python setup.py install
