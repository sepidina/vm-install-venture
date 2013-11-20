# Import settings
source ./settings.sh

bash import-boot.sh
abort_on_error "Importing and booting the VM."

ssh -i $rsa_key_filename -p $port_number -o StrictHostKeyChecking=no $username@localhost "cd Venturecxx; ./sanity_tests.sh"
abort_on_error "Running sanity tests."
