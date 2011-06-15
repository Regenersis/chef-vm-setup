%w(libreadline5-dev zlib1g-dev libssl-dev libxml2-dev libxslt1-dev).each do |pkg|
  package pkg
end
 
bash "install RVM" do
  user node[:user]
  code "bash < <( curl -s https://rvm.beginrescueend.com/install/rvm )"
end

template "/home/#{node[:user]}/.bashrvm" do
  source "bashrvm.erb"
  group node[:user]
  owner node[:user]
  mode "0644"
  variables(
    :user => node[:user]
  )
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


script "update with rvm source" do
  interpreter "bash"
  user node[:user]
  cwd "/home/#{node[:user]}"
  code <<-EOH
    echo "source .bashrvm" >> .bashrc
  EOH
  only_if do
    File.exists?("/home/#{node[:user]}/.bashrc")
  end
end
