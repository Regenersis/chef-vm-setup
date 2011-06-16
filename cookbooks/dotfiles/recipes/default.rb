bash_files = ["bashcommanddisplay", "bashhistory", "aliases", "paths"]
dot_files = ["gemrc", "irbrc"]

(dot_files + bash_files).each do |file|
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
  action :create
end

bash_files.each do |file|
  script "update with rvm source" do
    interpreter "bash"
    user node[:user]
    cwd "/home/#{node[:user]}"
    code <<-EOH
      echo "source .#{file}" >> .bashrc
    EOH
    only_if do
      File.exists?("/home/#{node[:user]}/.bashrc")
    end
  end
end



