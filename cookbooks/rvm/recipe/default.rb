%w(libreadline5-dev zlib1g-dev libssl-dev libxml2-dev libxslt1-dev).each do |pkg|
  package pkg
end
 
bash "install RVM" do
  user node[:user]
  code "bash < <( curl -s https://rvm.beginrescueend.com/install/rvm )"
  not_if "rvm --version"
end

template "/home/#{node[:user]}/.bashrvm" do
  source "bashrvm.erb"
  group node[:user]
  owner node[:user]
  mode "0644"
end

file "/home/#{node[:user]}/.bashrc" do
  group node[:user]
  owner node[:user]
  mode "0644"
  content "source .bashrvm"
  action :create
  not_if do
    File.exists?("/home/#{node[:user]}/.bashrc")
  end
end

ruby_block "update with rvm source" do
  block do
    File.open("/home/#{node[:user]}/.bashrc", "a+") do |file|
      file.write("source .bashrvm")
    end
  end
  action :create
  only_if do
    File.exists?("/home/#{node[:user]}/.bashrc")
  end
end

