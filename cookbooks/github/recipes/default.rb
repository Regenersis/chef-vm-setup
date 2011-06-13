require "rest-client"

package "kdiff3"

package "gitk"

template "/home/#{node[:user]}/.gitconfig" do
  github_details = RestClient.get("https://api.github.com/users/#{node[:github][:username]}")
  source "gitconfig.erb"
  owner node[:user]
  group node[:user]
  mode "0644"
  variables(
    :name => github_details["name"],
    :email => github_details["email"]
  )
end
