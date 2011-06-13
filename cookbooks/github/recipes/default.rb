package "kdiff"

package "gitk"

template "/home/#{node[:user]}/.gitconfig" do
  github_details = RestClient.get("http://api.github.com/users/#{node[:github][:username]}"
  source "gitconfig"
  variables(
    :name => github_details["name"],
    :email => github_details["email"]
  )
end
