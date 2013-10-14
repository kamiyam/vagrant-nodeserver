# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  vagrant = JSON.parse(File.read("./vagrant.json"))

  config.vm.hostname = vagrant["vm"]["hostname"]

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = vagrant["vm"]["box"]

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = vagrant["vm"]["box_url"]

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: vagrant["vm"]["private_ip"]

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  # config.vm.network :public_network

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: vagrant["vm"]["forwarded_port"]["guest"], host: vagrant["vm"]["forwarded_port"]["host"]

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder vagrant["vm"]["synced_folder"]["base"], vagrant["vm"]["synced_folder"]["sync"],
  :create=> true, :owner=> 'vagrant', :group=> 'vagrant', :mount_options=> ['dmode=777, fmode=666']

  # Example for VirtualBox:
    config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = true
    vb.name = "vb_name"
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.ssh.max_tries = vagrant["ssh"]["max_tries"]
  config.ssh.timeout   = vagrant["ssh"]["timeout"]

  # The path to the Berksfile to use with Vagrant Berkshelf
  config.berkshelf.berksfile_path = vagrant["berkshelf"]["path"]

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = vagrant["berkshelf"]["enabled"]

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  ## vagrant omnibus version set
  config.omnibus.chef_version = vagrant["omnibus"]["chef_version"]

  config.vm.provision :chef_solo do |chef|

    chef.json = JSON.parse(File.read("./chef.json"))
    # chef.json = {

    #   # :mysql => {
    #   #   :server_root_password => 'rootpass',
    #   #   :server_debian_password => 'debpass',
    #   #   :server_repl_password => 'replpass'
    #   # },
    # }

    chef.run_list = [
  		"recipe[apt]",
  		"recipe[vim]",
  		"recipe[git]",
      "recipe[nodebrew]"
    ]
  end

  # config.vm.provision :shell, :inline => "echo hello"
  # config.vm.provision :shell, :path => "initiarize.sh"
end
