script "install jruby" do
  interpreter "bash"
  user node[:user]
  cwd node[:home_dir]
  code <<-EOH
    . #{node[:home_dir]}/.bashrc
    rvm install jruby
  EOH
end
