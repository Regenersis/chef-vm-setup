include_recipe "build-essential"

case node[:platform]
  when "centos","redhat","fedora"
    package "openssl-devel"
  when "debian","ubuntu"
    package "libssl-dev"
end

bash "install nodejs from source" do
  cwd "/usr/local/src"
  user "root"
  code <<-EOH
    wget http://nodejs.org/dist/node-v#{node[:nodejs][:version]}.tar.gz && \
    tar zxf node-v#{node[:nodejs][:version]}.tar.gz && \
    cd node-v#{node[:nodejs][:version]} && \
    ./configure --prefix=#{node[:nodejs][:dir]} && \
    make && \
    make install
  EOH
  not_if "#{node[:nodejs][:dir]}/bin/node -v 2>&1 | grep 'v#{node[:nodejs][:version]}'"
end
