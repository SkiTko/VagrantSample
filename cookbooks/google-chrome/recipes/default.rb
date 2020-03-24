# Google Chrome

# install wget
package "wget" do
  action :install
end

# Download and install
execute 'download' do
  user    'root'
  command <<-EOM
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome-stable_current_amd64.deb
  sudo apt update
  sudo apt -f install -y
  EOM
end
