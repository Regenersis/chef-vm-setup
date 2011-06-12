remote_file "/home/#{node[:user]}/report-designer.tar.gz" do
  source "http://downloads.sourceforge.net/project/pentaho/Report%20Designer/3.8.0-stable/prd-ce-3.8.0-stable.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fpentaho%2Ffiles%2FReport%2520Designer%2F3.8.0-stable%2F&ts=1307919352&use_mirror=ignum"
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

template "/usr/bin/report-designer" do
  source "report-designer.erb"
  variables(
    :install_dir => node[:pentaho][:install_dir]
  )
end
