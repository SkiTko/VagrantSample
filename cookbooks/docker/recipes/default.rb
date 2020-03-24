# Docker-ce

# install
%w{
  apt-transport-https
  ca-certificates
  curl
  gnupg-agent
  software-properties-common
}.each do |pkg|
    package pkg do
        action [ :install ]
    end
end

# Add Docker's official GPG key
url = 'https://download.docker.com/linux/ubuntu/gpg'
execute 'download_chefdk' do
  command "curl -fsSL #{url} | apt-key add -"
  user    'root'
end

# add repository
execute 'install_chefdk' do
  user    'root'
  command <<-EOM
  add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
  EOM
end

# update package index
execute 'update_package_index' do
  user    'root'
  command <<-EOM
  apt-get update
  EOM
end

# Install
%w{
  docker-ce
  docker-ce-cli
  containerd.io
}.each do |pkg|
    package pkg do
        action [ :install ]
    end
end

