
bash "create dhl gem set" do
  interpreter "bash"
  cwd "."
  user node[:user]
  code <<-EOH
    . #{node[:home_dir]}/.bashrc"
    rvm 1.8.7
    rvm gemset create o2_dhl
    rvm 1.8.7@o2_dhl
    rvm gemset import o2_dhl.gems
  EOH
end

bash "create dhl gem set" do
  interpreter "bash"
  cwd "."
  user node[:user]
  code <<-EOH
    . #{node[:home_dir]}/.bashrc"
    rvm jruby
    rvm gemset create o2_dhl_jruby
    rvm jruby@o2_dhl_jruby
    rvm gemset import o2_dhl_jruby.gems
  EOH
end
