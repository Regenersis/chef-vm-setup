remote_file "/home/#{node[:user]}/report-designer.tar.gz" do
  source "http://sourceforge.net/projects/pentaho/files/Report%20Designer/3.8.0-stable/prd-ce-3.8.0-stable.tar.gz"
end

script "install pentaho" do
  interpreter "bash"
  user "root"
  cwd "/home/#{node[:user]}"
  code <<-EOH
    tar -zxvf report-designer.tar.gz
    cp report-designer #{node[:pentaho][:install_dir]}/report-designer -R
  EOH
end

tempate "/usr/bin/report-designer" do
  source "report-designer.erb"
  variables(
    :install_dir => node[:pentaho][:install_dir]
  )
end
