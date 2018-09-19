bash "install pip" do
  cwd "/root"
  user "root"
  group "root"  
  code <<-EOS
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
  EOS
end