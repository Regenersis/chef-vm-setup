script "install ruby 1.8" do
  interpreter "bash"
  user node[:user]
  cwd node[:home_dir]
  code <<-EOH
    rvm install 1.8
  EOH
end
