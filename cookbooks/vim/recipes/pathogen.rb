directory "/home/#{node[:user]}/.vim/autoload" do
  owner node[:user]
  group node[:user]
  mode "0755"
  action :create
end

remote_file "/home/#{node[:user]}/.vim/autoload/pathogen.vim" do
  source "pathogen/autoload/pathogen.vim"
  owner node[:user]
  group node[:user]
  mode "0755"
end
