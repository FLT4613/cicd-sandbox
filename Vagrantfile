Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.define :concourse do | concourse |
    concourse.vm.box = "sandbox-vm"
    concourse.vm.network :public_network
    concourse.vm.provision "shell", inline: <<-SCRIPT
    docker-compose -f /vagrant/docker-compose-concourse.yml up -d
    SCRIPT
  end

  config.vm.define :datasource do | datasource |
    datasource.vm.box = "sandbox-vm"
    datasource.vm.network :public_network
    datasource.vm.provision "shell", inline: <<-SCRIPT
    ufw allow 5000
    ufw allow 5001
    docker-compose -f /vagrant/docker-compose-datasource.yml up -d
    SCRIPT
  end
end