remote_file "/home/#{node[:user]}/pentaho.tar.gz" do
  source "http://downloads.sourceforge.net/project/pentaho/Data%20Integration/4.1.0-stable/pdi-ce-4.1.0-stable.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fpentaho%2Ffiles%2FData%2520Integration%2F4.1.0-stable%2F&ts=1307919295&use_mirror=kent"
end

script "install pentaho" do
  interpreter "bash"
  user "root"
  cwd "/home/#{node[:user]}"
  code <<-EOH
    tar -zxvf pentaho.tar.gz 
    mkdir #{node[:pentaho][:install_dir]}
    cp pentaho #{node[:pentaho][:install_dir]}/data-integration -R
    #{node[:pentaho][:install_dir]}/data_integration/set-pentaho-env
  EOH
end

["kitchen", "pan", "spoon"].each do |app|
  template "/usr/bin/#{app}" do
    source "#{app}.erb"
    variables(
      :install_dir => node[:pentaho][:install_dir]
    )
  end
end
