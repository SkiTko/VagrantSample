bash "install awscli" do
  cwd "/"
  user "root"
  group "root"  
  code <<-EOS
    pip install --upgrade awscli
  EOS
end