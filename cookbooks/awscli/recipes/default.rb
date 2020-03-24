# Angular

# AWS CLI
execute 'aws-cli' do
  user    'root'
  command <<-EOM
  curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
  cd /tmp
  rm -fr ./aws
  unzip awscliv2.zip
  ./aws/install --update
  EOM
end
