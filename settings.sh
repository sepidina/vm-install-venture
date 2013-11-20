project_name=venture-vm-virtualbox
project_dir=$project_name
ovf_full_path="${project_dir}"/"${project_name}".ovf
port_number=2222
username=$(grep '^d-i passwd/username string' ubuntu-12.04.2-server-preseed.cfg | awk '{print $NF}')
rsa_key_filename=vm_guest_id_rsa
