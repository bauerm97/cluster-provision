docker_container 'swarm-agent' do
  repo 'swarm'
  restart_policy 'always'
  command "join --advertise #{node['network']['interfaces']['eth1']['addresses'].keys[1]}:2376 etcd://192.168.2.1:2379"
  action :run_if_missing
end
