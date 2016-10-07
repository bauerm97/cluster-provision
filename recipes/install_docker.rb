#
# Cookbook Name:: cluster-provision
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
  host [ "tcp://0.0.0.0:2376", 'unix:///var/run/docker.sock' ]
  storage_driver 'devicemapper'
  mtu '65520'
  #cluster_store# '
  #cluster_advertise
  #insecure_registry
  action [:create, :start]
end
