#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2008-2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


include_recipe "mysql::client"

# generate all passwords
node.set_unless['mysql']['server_debian_password'] = ""
node.set_unless['mysql']['server_root_password']   = ""
node.set_unless['mysql']['server_repl_password']   = ""


directory "/var/cache/local/preseeding" do
  owner "root"
  group "root"
  mode 0755
  recursive true
end

execute "preseed mysql-server" do
  command "debconf-set-selections /var/cache/local/preseeding/mysql-server.seed"
  action :nothing
end

template "/var/cache/local/preseeding/mysql-server.seed" do
  source "mysql-server.seed.erb"
  owner "root"
  group "root"
  mode "0600"
  notifies :run, resources(:execute => "preseed mysql-server"), :immediately
end

template "/etc/mysql/debian.cnf" do
  source "debian.cnf.erb"
  owner "root"
  group "root"
  mode "0600"
end

package "mysql-server" do
  action :install
end

service "mysql" do
  service_name "mysql"
  restart_command "restart mysql"
  stop_command "stop mysql"
  start_command "start mysql"
  supports :status => true, :restart => true, :reload => true
  action :nothing
end

template  "/etc/mysql/my.cnf" do
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "mysql"), :immediately
end

