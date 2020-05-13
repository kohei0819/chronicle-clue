# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'
require 'shellwords'

Vagrant.require_version '>= 2.0.0'

%w(vagrantconfig.rb vagrantconfig.local.rb).each do |file|
  path = File.join(File.dirname(__FILE__), file)
  load path if File.exist?(path)
end

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'
  config.disksize.size = '5GB'

  config.vm.network 'forwarded_port', guest: 3000, host: 3000
  config.vm.network 'forwarded_port', guest: 5000, host: 5000
  config.vm.network 'private_network', ip: $private_network_ip
  config.vm.network 'public_network' if $public_network_enabled

  config.vm.synced_folder '.', $synced_folder_guest_path,
    $synced_folder_options.merge(type: $synced_folder_type)

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = $virtualbox_memory
    vb.cpus = $virtualbox_cpus
  end

  config.vm.provision 'build-server', type: 'ansible_local' do |ansible|
    ansible.extra_vars = $ansible_extra_vars
    ansible.groups = {vagrant: 'default'}
    ansible.playbook = $ansible_playbook
    ansible.provisioning_path = "#{$synced_folder_guest_path}/provisioning"
  end

end
