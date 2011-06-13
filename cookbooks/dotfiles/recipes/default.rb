["gemrc", "irbrc"].each do |file|
  template "/home/#{node[:user]}/.#{file}" do
    source "#{file}.erb"
    owner node[:user]
    group node[:user]
    mode "0644"
  end
end
