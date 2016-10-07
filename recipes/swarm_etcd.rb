docker_container 'etcd' do
  volumes ['/usr/share/ca-certificates/:/etc/ssl/certs']
  port '4001:4001'
  port '2380:2380'
  port '2379:2379'
  repo 'quay.io/coreos/etcd'
  restart_policy 'always'
  command 'etcd  -name etcd0  -advertise-client-urls http://192.168.2.1:2379,http://192.168.2.1:4001  -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001  -initial-advertise-peer-urls http://192.168.2.1:2380  -listen-peer-urls http://0.0.0.0:2380  -initial-cluster-token etcd-cluster-1  -initial-cluster etcd0=http://192.168.2.1:2380  -initial-cluster-state new'
  action :run_if_missing
end
