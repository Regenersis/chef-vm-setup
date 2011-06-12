directory "/home/#{node[:user]}/.vim/autoload" do
  owner node[:user]
  group node[:user]
  mode "0644"
  action :create
end

remote_file "/home/#{node[:user]}/.vim/autoload/pathogen.vim" do
  source "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"
  owner node[:user]
  group node[:user]
  mode "0644"
end
