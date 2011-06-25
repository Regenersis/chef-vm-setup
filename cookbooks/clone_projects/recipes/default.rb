begin
  require "rest-client"
rescue

end

github_api_url = "https://#{node[:github][:username]}:#{node[:github][:password]}@api.github.com"
organisations_url = "#{github_api_url}/user/orgs"
orgs = JSON.parse(RestClient.get(organisations_url))

orgs.each do |org|
  repos_url = "#{github_api_url}/orgs/#{org["login"]}/repos"
  repos = JSON.parse(RestClient.get(repos_url))

  repos.each do |repo|
    git "#{node[:home_dir}/projects/#{repo["name"]}" do
      user node[:user]
      group node[:user]
      repository repo["ssh_url"]
      reference "master"
      action :sync
    end
  end

end

