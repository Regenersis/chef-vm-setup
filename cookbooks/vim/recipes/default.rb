#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2010, Opscode, Inc.
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

package "vim"
package "vim-gnome"

[".vim", ".vim/bundle"].each do |dir|
  directory "/home/#{node[:user]}/#{dir}" do
    owner node[:user]
    group node[:user]
    mode "0755"
    action :create
  end
end

template "/home/#{node[:user]}/.vimrc" do 
  owner node[:user]
  group node[:user]
  mode "0755"  
  source "vimrc.erb"
end

include_recipe "vim::pathogen"
include_recipe "vim::plugins"
