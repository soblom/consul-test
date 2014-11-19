# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'ubuntu/trusty64'

  # Shared configuration
  config.vm.provision 'shell', path: 'provision.sh'
  config.vm.synced_folder 'config', '/tmp/consul_conf/'

  config.vm.define 'consul_bootstrap' do |cb|
    cb.vm.network 'private_network', ip: '192.0.2.1'
  end
  config.vm.define 'consul_server_1' do |cs1|
    cs1.vm.network 'private_network', ip: '192.0.2.2'
  end
  config.vm.define 'consul_server_2' do |cs2|
    cs2.vm.network 'private_network', ip: '192.0.2.3'
  end
  config.vm.define 'consul_client' do |cc|
    cc.vm.network 'private_network', ip: '192.0.2.50'
  end
end
