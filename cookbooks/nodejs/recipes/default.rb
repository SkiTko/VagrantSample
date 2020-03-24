# Node.js

# install curl
package "curl" do
  action :install
end

# Download
execute 'download' do
  user    'root'
  command "curl -sL https://deb.nodesource.com/setup_12.x | bash -"
end

# install node.js
package "nodejs" do
  action :install
end
