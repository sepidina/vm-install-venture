project_name=venture-vm-virtualbox
project_dir=$project_name
ovf_full_path="${project_dir}"/"${project_name}".ovf
port_number=2222
username=$(grep '^d-i passwd/username string' ubuntu-12.04.2-server-preseed.cfg | awk '{print $NF}')
password=$username
rsa_key_filename=vm_guest_id_rsa

function abort_on_error () {
    if [[ $? -ne "0" ]]; then
        echo FAILED: $1
        exit 1
    fi
}

function warn_on_error () {
    if [[ $? -ne "0" ]]; then
        echo FAILED: $1
        echo Continuing
    fi
}
