# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.network "forwarded_port", guest: 3838, host: 3838
  config.vm.network "forwarded_port", guest: 8787, host: 8787

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.vm.provision "chef_solo" do |chef|
    chef.roles_path = "roles"
    chef.add_role("shiny")

    # TODO: uncomment the `chef.arguments` line if you need to accept
    # the chef license agreement on provision: https://docs.chef.io/chef_license.html
    # chef.arguments = "--chef-license accept"
  end

  # How to map a local folder to shiny
  #config.vm.synced_folder "/path/to/your/directory", "/home/shiny_apps/shared",
  #  owner: "shiny_apps", group: "shiny"
end
