#
# Cookbook Name:: main
# Recipe:: default
#
# Copyright 2011, Example Com
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

def retryable(options = {}, &block)
  opts = { :tries => 1, :on => Exception }.merge(options)

  retry_exception, retries = opts[:on], opts[:tries]

  begin
    return yield
  rescue retry_exception
    retry if (retries -= 1) > 0
  end

  yield
end

include_recipe "mysql::server"
include_recipe "rabbitmq"
include_recipe "couchdb"
include_recipe "vim"
include_recipe "java::sun"
include_recipe "rubymine"
include_recipe "nodejs"
include_recipe "pentaho"
include_recipe "github"
include_recipe "dotfiles"
include_recipe "rvm"
