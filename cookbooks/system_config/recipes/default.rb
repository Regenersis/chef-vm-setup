file "/etc/timezone" do
  owner "root"
  group "root"
  mode "0644"
  content "Europe/London"
  action :create
end
