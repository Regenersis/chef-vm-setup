dot_files = ["gemrc", "irbrc", "bashcommanddisplay",
  "bashhistory", "aliases", "paths"]

dot_files.each do |file|
  template "/home/#{node[:user]}/.#{file}" do
    source "#{file}.erb"
    owner node[:user]
    group node[:user]
    mode "0644"
  end
end

file "/home/#{node[:user]}/.bashrc" do
  action :delete
end


file "/home/#{node[:user]}/.bashrc" do
  group node[:user]
  owner node[:user]
  mode "0644"
  content dot_files.map{|df| "source .#{file}"}.join("\n")
  action :create
end



