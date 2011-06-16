include_recipe "npm"

bash "install coffeescript" do
  interpreter "bash"
  user "root"
  cwd node[:home_dir]
  code <<-EOH
    npm install -g coffee-script
  EOH
end
