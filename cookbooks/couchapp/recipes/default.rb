script "install rubymine" do
  interpreter "bash"
  user "root"
  cwd node[:temp_folder]
  code <<-EOH
    curl -O http://python-distribute.org/distribute_setup.py
    sudo python distribute_setup.py
    easy_install pip
    sudo pip install couchapp
  EOH
end
