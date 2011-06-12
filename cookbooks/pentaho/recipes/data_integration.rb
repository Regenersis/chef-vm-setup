remote_file "/home/#{node[:user]}/report-designer.tar.gz" do
  source "http://sourceforge.net/projects/pentaho/files/Data%20Integration/4.1.0-stable/pdi-ce-4.1.0-stable.tar.gz"
end

script "install pentaho" do
  interpreter "bash"
  user "root"
  cwd "/home/#{node[:user]}"
  code <<-EOH
    tar -zxvf report-designer.tar.gz 
    mkdir #{node[:pentaho][:install_dir]}
    cp data-integration #{node[:pentaho][:install_dir]}/data-integration -R
    #{node[:pentaho][:install_dir]}/data_integration/set-pentaho-env
  EOH
end

tempate "/usr/bin/report-designer" do
  source "report-designer.erb"
  variables(
    :install_dir => node[:pentaho][:install_dir]
  )
end
