# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'boxcutter/ubuntu1404'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1024
  end

  config.vm.provision 'shell', inline: '/vagrant/full.sh'
end
