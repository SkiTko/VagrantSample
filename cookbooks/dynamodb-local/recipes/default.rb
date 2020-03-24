jdk_url = 'https://d3pxv6yz143wms.cloudfront.net/11.0.5.10.1/java-11-amazon-corretto-jdk_11.0.5.10-1_amd64.deb'
dynamo_db_local_url = 'https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.tar.gz'
dynamo_db_local_install_path = '/home/vagrant/opt/dynamodb_local'

# JDK
execute 'download_jdk' do
  user    'root'
  cwd     '/tmp'
  command <<-EOM
  wget #{jdk_url}
  EOM
  not_if { File.exists? "/tmp/#{File.basename(jdk_url)}" }
end
execute 'install_jdk' do
  user    'root'
  cwd     '/tmp'
  command <<-EOM
  apt install -y /tmp/#{File.basename(jdk_url)}
  EOM
end


# DynamoDB Local
directory dynamo_db_local_install_path do
  owner "vagrant"
  group "vagrant"
  recursive true
  mode 0755
  action :create
  not_if { File.exists? dynamo_db_local_install_path }
end

file "#{dynamo_db_local_install_path}/#{File.basename(dynamo_db_local_url)}" do
  action :delete
  only_if { File.exists? "#{dynamo_db_local_install_path}/#{File.basename(dynamo_db_local_url)}" }
end

execute 'install_ddbl' do
  user    'vagrant'
  cwd     dynamo_db_local_install_path
  command <<-EOM
  wget #{dynamo_db_local_url}
  tar xfz #{File.basename(dynamo_db_local_url)}
  EOM
end

cookbook_file "#{dynamo_db_local_install_path}/run_dynamo_db.sh" do
    source      "run_dynamo_db.sh"
    mode        '0755'
end
