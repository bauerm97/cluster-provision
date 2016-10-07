cookbook_file 'ofed_install.tgz' do
  source 'ofed_install.tgz'
  action :create
end

execute 'unpack_ofed' do
  command 'tar xzf ofed_install.tgz'
  creates '/MLNX_OFED_LINUX-3.4-1.0.0.0-ubuntu16.04-x86_64/mlnxofedinstall'
  action :run
end

execute 'install_ofed' do
  command '/MLNX_OFED_LINUX-3.4-1.0.0.0-ubuntu16.04-x86_64/mlnxofedinstall --force'
  live_stream true
  action :run
end
