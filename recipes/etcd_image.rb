docker_image 'quay.io/coreos/etcd' do
  action :pull_if_missing
end
