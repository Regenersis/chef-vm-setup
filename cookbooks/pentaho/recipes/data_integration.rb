script "install pentaho" do
  interpreter "bash"
  user "root"
  cwd "/home/#{node[:user]}"
  code <<-EOH
    wget http://downloads.sourceforge.net/project/pentaho/Data%20Integration/4.1.0-stable/pdi-ce-4.1.0-stable.tar.gz
    tar -zxvf pdi-ce-4.1.0-stable.tar.gz 
    mkdir #{node[:pentaho][:install_dir]}
    cp data-integration #{node[:pentaho][:install_dir]}/data-integration -R
    #{node[:pentaho][:install_dir]}/data-integration/set-pentaho-env.sh
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
