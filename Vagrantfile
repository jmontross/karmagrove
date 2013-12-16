# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  # you get this one by installing with vagrant box add precise64

  config.vm.box = "precise64"



  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.

  config.vm.forward_port 80, 8082
  config.vm.forward_port 443, 8081

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  #config.vm.share_folder "v-data", "/code", "/Users/joshua/code"

  config.vm.share_folder "v-data", "/opt/kalani", "/Users/josh/code/kalani"


  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "v-data", "/opt/karmagrove", "./"


  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "../my-recipes/cookbooks"
    chef.roles_path = "../my-recipes/roles"
    chef.data_bags_path = "../my-recipes/data_bags"
    chef.add_recipe "karmagrove"


    # You may also specify custom JSON attributes:
    chef.json = { :mysql_password => "foo" }
  end


end
