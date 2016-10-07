docker_container 'swarm-agent-master' do
  repo 'swarm'
  restart_policy 'always'
  port '3376:3376'
  command 'manage -H tcp://0.0.0.0:3376 --strategy spread --advertise 192.168.2.1:3376 etcd://192.168.2.1:2379'
  action :run_if_missing
end
