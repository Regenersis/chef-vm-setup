begin
  require "rest-client"
rescue

end

directory "#{node[:home_dir]}/projects" do
  owner node[:user]
  group node[:user]
  mode "0755"
  action :create
end

github_api_url = "https://#{node[:github][:username]}:#{node[:github][:password]}@api.github.com"
organisations_url = "#{github_api_url}/user/orgs"
orgs = JSON.parse(RestClient.get(organisations_url))

orgs.each do |org|
  repos_url = "#{github_api_url}/orgs/#{org["login"]}/repos"
  repos = JSON.parse(RestClient.get(repos_url))
  repos.each do |repo|
    unless repo["size"] == 0
      git "#{node[:home_dir]}/projects/#{repo["name"]}" do
        user node[:user]
        group node[:user]
        repository repo["ssh_url"]
        reference "master"
        action :sync
      end
    end
  end
end

