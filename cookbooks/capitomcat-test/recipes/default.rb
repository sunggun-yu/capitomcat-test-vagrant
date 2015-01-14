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
  group_id 5100
  action [ :remove, :create ]
end

sudo 'jenkins' do
  user      "jenkins"
  runas     'ALL'
  commands  ['/etc/init.d/tomcat7']
  nopasswd  true
end