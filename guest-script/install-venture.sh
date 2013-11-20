function abort_on_error () {
    if [[ $? -ne "0" ]]; then
        echo FAILED: $1
        exit 1
    fi
}

# If the repo were public, could just clone it
# git clone https://github.com/mit-probabilistic-computing-project/Venturecxx
# cd Venturecxx
# git checkout release_v0.1
# cd ..

if stat -t venture-*.tgz >/dev/null 2>&1; then
    tar --extract --gunzip --file venture-*.tgz
fi

# Build Venture
cd Venturecxx
echo "venture" | sudo -S -p "" pip install -r requirements.txt
abort_on_error "Installing Python dependencies."
echo "venture" | sudo -S -p "" python setup.py install
abort_on_error "Installing Venture."
