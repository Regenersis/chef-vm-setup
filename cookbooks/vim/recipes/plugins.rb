def retryable(options = {}, &block)
  opts = { :tries => 1, :on => Exception }.merge(options)

  retry_exception, retries = opts[:on], opts[:tries]

  begin
    return yield
  rescue retry_exception
    retry if (retries -= 1) > 0
  end

  yield
end


node[:vim_plugins].each do |repo|
  retryable(:tries => 3, :on => RuntimeError) do
    dirname = repo.split('/').last.gsub(".git", "").gsub(".", "-").gsub("-vim", "").gsub("vim-", "")
    git "/home/#{node[:user]}/.vim/bundle/#{dirname}" do
      user node[:user]
      group node[:user]
      repository repo
      reference "master"
      action :sync
    end
  end
end


script "install command-t" do
  interpreter "bash"
  user node[:user]
  cwd "/home/#{node[:user]}/.vim/bundle/Command-T/ruby/command-t"
  code <<-EOH
    ruby extconf.rb
    make
  EOH
end

script "install snipmate snippets" do
  interpreter "bash"
  user node[:user]
  cwd "/home/#{node[:user]}/.vim/bundle/snipmate-snippets"
  code <<-EOH
    rake deploy_local
  EOH
end
