script "install jruby" do
  interpreter "bash"
  user node[:user]
  cwd node[:home_dir]
  code <<-EOH
    rvm install jruby
  EOH
end
