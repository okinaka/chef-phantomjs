# Japanese TrueType font
%w{ fontconfig fonts-ipaexfont }.each do |pkg|
  package pkg
end

cookbook_file "fonts.conf" do
  path "/etc/fonts/fonts.conf"
end
