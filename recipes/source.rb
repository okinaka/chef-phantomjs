# source
# see: http://phantomjs.org/build.html
include_recipe "build-essential"

%w{chrpath git libssl-dev libfontconfig1-dev}.each do |pkg|
  package pkg
end

git "/usr/local/src/phantomjs" do
  repository "git://github.com/ariya/phantomjs.git"
  revision "1.9"
end

bash "install_phantomjs" do
  cwd "/usr/local/src/phantomjs"
  code <<-EOH
    ./build.sh --confirm
  EOH
end
