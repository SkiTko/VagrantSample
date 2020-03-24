# Basic development

# install
%w{
  build-essential
  git
  curl
  wget
  unzip
  zip
  jq
}.each do |pkg|
    package pkg do
        action [ :install ]
    end
end
