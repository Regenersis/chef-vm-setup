remote_file "/home/#{node[:user]}/pentaho.tar.gz" do
  source "http://sourceforge.net/projects/pentaho/files/Report%20Designer/3.8.0-stable/prd-ce-3.8.0-stable.tar.gz"
end

script "install pentaho" do
  interpreter "bash"
  user "root"
  cwd "/home/#{node[:user]}"
  code <<-EOH
    tar -zxvf pentaho.tar.gz
    cp report-designer #{node[:pentaho][:install_dir]}/report-designer -R
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
