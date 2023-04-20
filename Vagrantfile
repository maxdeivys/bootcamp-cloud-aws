$install_basic = <<-SCRIPT
  echo "INSTALL BASIC"
  apt-get update && \
  apt-get install curl vim git software-properties-common unzip -y
SCRIPT

VAGRANT_EXPERIMENTAL="disks"

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "dio-bootcamp-aws.localhost"
  #config.vm.disk :disk, size: "10GB", name: "extra_storage"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "dio-bootcamp-aws"
    vb.memory = 1024
    vb.cpus = 1
  end

  config.vm.network "forwarded_port", guest: 8888, host: 8888
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3307, host: 3307
  config.vm.network "forwarded_port", guest: 8080, host: 8181
  config.vm.network "private_network", ip: "192.168.50.31"
  config.vm.network "public_network", auto_config: false

  config.vm.synced_folder "./mount_host", "/mount_host"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell",
    inline: $install_basic

  config.vm.provision "docker" do |d|

  end

end