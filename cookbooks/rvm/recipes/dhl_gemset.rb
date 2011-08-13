["o2_dhl", "o2_dhl_jruby"].each do |file|
  template "#{node[:temp_folder]}/#{file}.gems" do
    source "#{file}.gems.erb"
    group node[:user]
    owner node[:user]
    mode "0644"
  end
end

bash "create dhl gem set" do
  interpreter "bash"
  cwd node[:home_dir]
  user node[:user]
  code <<-EOH
    . #{node[:home_dir]}/.bashrc
    rvm 1.8.7
    rvm gemset create o2_dhl
    rvm 1.8.7@o2_dhl
    gem sources -a http://gems.therepairline.co.uk
    gem update --system 1.5.3
    rvm gemset import #{node[:temp_folder]}/o2_dhl.gems
  EOH
end

bash "create dhl gem set" do
  interpreter "bash"
  cwd "."
  user node[:user]
  code <<-EOH
    . #{node[:home_dir]}/.bashrc
    rvm jruby
    rvm gemset create o2_dhl_jruby
    rvm jruby@o2_dhl_jruby
    gem sources -a http://gems.therepairline.co.uk
    rvm gemset import #{node[:temp_folder]}/o2_dhl_jruby.gems
  EOH
end
