git "/home/#{node[:user]}/.vim/pathogen"  do
  user node[:user]
  group node[:user]
  repository "https://github.com/tpope/vim-pathogen.git"
  reference "master"
  action :sync
end

link "/home/#{node[:user]}/.vim/pathogen/auto_load" do
  to "/home/#{node[:user]}/.vim/bundle"
end
