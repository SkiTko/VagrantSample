# Angular

# install
# install npm packages
%w{
  typescript
  '@angular/cli'
  '@aws-amplify/cli'
}.each do |pkg|
    execute pkg do
      user    'root'
      command <<-EOM
      npm install -g #{pkg}
      EOM
    end
end
