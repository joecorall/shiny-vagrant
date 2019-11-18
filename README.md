# Ubuntu Shiny Server + RStudio Vagrant Box

Spins up a local Shiny Server and RStudio Server.

The following R packages are also installed:

* ggplot2
* gridExtra
* raster
* rmarkdown (for shiny)
* shiny
* sf

You can choose to not install any of the above packages
by commenting them out from the file roles/shiny.rb

## Requirements

On your local machine you'll need:

* 4 GB of RAM available (this can be modified in Vagrantfile if you need less or can give more)
* Install [Git](https://git-scm.com/downloads)
* Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Install [Vagrant](https://www.vagrantup.com/downloads.html)

## Install


You may need to edit the Vagrantfile if you've never accepted the [Chef license agreement](https://docs.chef.io/chef_license.html) on your host machine.
If on `vagrant up --provision` you receive an error about the chef license agreement,
you can uncomment line 20 in Vagrantfile to accept the license.

### Commands

```bash
git clone https://github.com/joecorall/shiny-vagrant shiny

cd shiny

# If this is your first time running a vagrant box on your machine,
# you might need to install vbguest
vagrant plugin install vagrant-vbguest


# Else if you recently upgraded vagrant/virtualbox
# (usually when updating one the other should be updated)
# you may also need to update vbguest
vagrant plugin update vagrant-vbguest

# uncomment line 20 in Vagrantfile if you need to accept the Chef license agreement

# bring up the server
vagrant up --provision
```

After that you can visit


http://localhost:8787 to see the RStudio server

* username: vagrant
* password: vagrant

http://localhost:3838 to see the Shiny server

* Shiny apps are set to be hosted in /home/shiny_apps
* See bottom of Vagrantfile for an example of how to add Shiny apps on your local machine to the Shiny Server.
