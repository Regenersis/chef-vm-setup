node[:vim_plugins].each do |repo|
  dirname = repo.split('/').last.gsub(".git", "").gsub(".", "-")
  git "/home/#{node[:user]}/.vim/bundle/#{dirname}" do
    user node[:user]
    group node[:user]
    repository repo
    reference "master"
    action :sync
  end
end


script "install command-t" do
  interpreter "bash"
  user node[:user]
  cwd "/home/#{node[:user]}/.vim/bundle/Command-T/ruby/command-t"
  code <<-EOH
    ruby extconf.rb
    make
  EOH
end

script "install snipmate snippets" do
  interpreter "bash"
  user node[:user]
  cwd "/home/#{node[:user]}/.vim/bundle/snipmate-snippets"
  code <<-EOH
    rake deploy_local
  EOH
end
