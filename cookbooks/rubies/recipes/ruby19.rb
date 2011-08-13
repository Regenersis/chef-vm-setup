script "install ruby 1.8" do
  interpreter "bash"
  user node[:user]
  cwd node[:home_dir]
  code <<-EOH
    . #{node[:home_dir]}/.bashrc
    rvm install 1.9.2
  EOH
end
