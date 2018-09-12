Vagrant.configure("2") do |config|
  config.vm.box = "sandbox-vm"
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.define :concource do | concource |
    concource.vm.network :private_network, ip: "192.168.33.10"
  end

  config.vm.define :datasource do | datasource |
    datasource.vm.network :private_network, ip: "192.168.33.11"
  end

  config.vm.define :staging do | staging |
    staging.vm.network :private_network, ip: "192.168.33.12"
  end

  config.vm.define :production do | production |
    production.vm.network :private_network, ip: "192.168.33.13"
  end
end