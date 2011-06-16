apt_repository "couchapp" do
  uri "ppa:couchapp/couchapp"
  action :add
end

package "couchapp"
