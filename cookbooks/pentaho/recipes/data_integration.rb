remote_file "/home/#{node[:user]}/pentaho.tar.gz" do
  source "http://sourceforge.net/projects/pentaho/files/Data%20Integration/4.1.0-stable/pdi-ce-4.1.0-stable.tar.gz"
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
  tempate "/usr/bin/#{app}" do
    source "#{app}.erb"
    variables(
      :install_dir => node[:pentaho][:install_dir]
    )
  end
end
