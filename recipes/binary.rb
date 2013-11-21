src_filename = "phantomjs-1.9.2-linux-x86_64"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}.tar.bz2"
extract_path = "#{Chef::Config['file_cache_path']}/#{src_filename}"
install_path = "/usr/local/bin"

package "bzip2"

remote_file src_filepath do
  source "https://phantomjs.googlecode.com/files/#{src_filename}.tar.bz2"
  action :create_if_missing
end

bash 'extract' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    tar xjf #{src_filepath}
    cp #{extract_path}/bin/phantomjs #{install_path}
    cp #{extract_path}/examples/rasterize.js /tmp/
  EOH
  not_if { ::File.exists?(extract_path) }
end
