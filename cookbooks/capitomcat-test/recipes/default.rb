#
# Cookbook Name:: capitomcat-test
# Recipe:: default
#
# Copyright 2015, sunggun.me
#
# All rights reserved - Do Not Redistribute
#

include_recipe "users"
include_recipe "sudo"

users_manage "jenkins" do
  group_id 5101
  action [ :remove, :create ]
end

users_manage "tomcat" do
  group_id 5201
  action [ :remove, :create ]
end

sudo 'capitomcat' do
  template    'capitomcat-sudoers.erb'
  variables(
      :cmd          => "/etc/init.d/tomcat7",
      :tomcat_user  => "tomcat"
  )
end

# WAR file directory for "use context" option
directory "/var/capitomcat" do
  owner 'tomcat'
  group 'tomcat'
  mode '0755'
  action :create
end
