#http://download.jetbrains.com/ruby/RubyMine-3.1.1.tar.gz
#http://download.jetbrains.com/ruby/rubymine-2.0.2.tar.gz

remote_file "/home/#{node[:user]}/RubyMine-3.1.1.tar.gz" do
  source "http://download.jetbrains.com/ruby/RubyMine-3.1.1.tar.gz"
end

script "install rubymine" do
  interpreter "bash"
  user "root"
  cwd "/home/#{node[:user]}"
  code <<-EOH
    tar -zxvf RubyMine-3.1.1.tar.gz
    cp RubyMine-3.1.1 #{node[:rubymine][:install_dir]} -R
  EOH
end

template "/usr/bin/rubymine" do
  source "rubymine.erb"
  variables(
    :install_dir => node[:rubymine][:install_dir]
  )
end
