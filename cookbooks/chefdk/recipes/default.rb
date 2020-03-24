# install wget
package "wget" do
  action :install
end

# Download Chefdk
url = 'https://packages.chef.io/files/stable/chefdk/4.6.35/ubuntu/18.04/chefdk_4.6.35-1_amd64.deb'
execute 'download_chefdk' do
  command "wget #{url}"
  user    'vagrant'
  cwd     '/tmp'
end

# install
execute 'install_chefdk' do
  command "dpkg -i /tmp/chefdk_4.6.35-1_amd64.deb"
  user    'root'
end
