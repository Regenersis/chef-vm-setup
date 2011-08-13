package "libcurl" do
  package_name 'libcurl4-gnutls-dev'
  action :install
  provider Chef::Provider::Package::SudoAptGet
end
