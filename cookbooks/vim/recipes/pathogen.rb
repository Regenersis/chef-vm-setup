git "/home/#{node[:user]}/pathogen"  do
  user node[:user]
  group node[:user]
  repository "https://github.com/tpope/vim-pathogen.git"
  reference "master"
  action :sync
end

remote_directory "/home/#{node[:user]}/.vim" do
  source "/home/#{node[:user]}/pathogen/auto_load"
  owner node[:user]
  group node[:user]
  mode "0775"
  files_owner node[:user]
  files_group node[:user]
  files_mode "0644"
  
end
