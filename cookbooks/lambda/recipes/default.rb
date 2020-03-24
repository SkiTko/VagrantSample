# install npm packages
%w{
  typescript
  serverless
  aws-cdk
}.each do |pkg|
    execute pkg do
      user    'root'
      command <<-EOM
      npm install -g #{pkg}
      EOM
    end
end
