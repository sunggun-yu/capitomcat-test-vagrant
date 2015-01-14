# -*- mode: ruby -*-
# vi: set ft=ruby :

$provision_script = <<SCRIPT
#!/bin/bash

apt-get update
apt-get install vim -y

SCRIPT

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Define base image
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  
  config.vm.provision :shell, :inline => $provision_script
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.data_bags_path = "data_bags"
    chef.add_recipe "sudo"
    chef.add_recipe "java"
    chef.add_recipe "tomcat"
    chef.add_recipe "capitomcat-test"
    chef.json = {
      "authorization" => {
        "sudo" => {
          "users" => [
            "vagrant"
          ],
          "passwordless" => true,
          "include_sudoers_d" => true
        }
      },
      "java" => {
        "install_flavor" => "oracle",
        "jdk_version" => "7",
        "oracle" => {
          "accept_oracle_download_terms" => true
        }
      },
      "tomcat" => {
          "base_version"=> "7"
      }
    }
  end
end
