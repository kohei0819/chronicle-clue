$private_network_ip = '192.168.33.10'
$public_network_enabled = false

$synced_folder_guest_path = '/vagrant'
$synced_folder_type = nil
$synced_folder_options = {
  mount_options: ['dmode=777', 'fmode=777'],
}

$virtualbox_memory = 1024
$virtualbox_cpus = 1

$ansible_playbook = 'vagrant.yml'
$ansible_extra_vars = {
  web_domain: $private_network_ip,
  web_document_root: "#{$synced_folder_guest_path}/public",
  vagrant_initial_dir: $synced_folder_guest_path
}
