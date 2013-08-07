# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.omnibus.chef_version = '11.6.0'
  config.vm.provision :shell, inline: 'sudo chef-apply /vagrant/recipe.rb'
  config.vm.define :ubuntu do |ubuntu|
    ubuntu.vm.box = "ubuntu_13.04_base"
    ubuntu.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
  end
  config.vm.define :centos do |centos|
    centos.vm.box = "centos_6.4_base"
    centos.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4_provisionerless.box"
  end
end
