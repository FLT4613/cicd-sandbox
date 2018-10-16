Vagrant.configure("2") do |config|
  config.vm.box = "sandbox-vm"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.define :concourse do | concourse |
    concourse.vm.provider "virtualbox" do |vm|
      vm.memory = 2048
    end
    concourse.vm.hostname = "concourse"
    concourse.vm.network :public_network, ip: "192.168.0.200", bridge: "en1: Wi-Fi (AirPort)"
    concourse.vm.provision "shell", inline: <<-SCRIPT
    docker-compose -f /vagrant/docker-compose-concourse.yml up -d
    SCRIPT
  end

  config.vm.define :concourseworker do | concourseworker |
    concourseworker.vm.hostname = "concourseworker"
    concourseworker.vm.network :public_network, ip: "192.168.0.201", bridge: "en1: Wi-Fi (AirPort)"
  end

  config.vm.define :datasource do | datasource |
    datasource.vm.provider "virtualbox" do |vm|
      vm.memory = 2048
    end
    datasource.vm.hostname = "datasource"
    datasource.vm.network :public_network, ip: "192.168.0.202", bridge: "en1: Wi-Fi (AirPort)"
    datasource.vm.provision "shell", inline: <<-SCRIPT
    ufw allow 5000
    ufw allow 5001
    docker-compose -f /vagrant/docker-compose-datasource.yml up -d
    SCRIPT
  end
end