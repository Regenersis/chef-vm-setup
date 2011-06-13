["gemrc", "irbrc"].each do |file|
template "/home/#{node[:user]}/.#{file}" do
  source "#{file}.erb"
  owner node[:user]
  group node[:user]
  mode "0644"
  variables(
    :name => github_details["name"],
    :email => github_details["email"]
  )
end
