require 'chef/provider/package'
require 'chef/mixin/command'
require 'chef/resource/package'

class Chef
  class Provider
    class Package
      class SudoAptGet < Chef::Provider::Package

        def load_current_resource
          @current_resource = Chef::Resource::Package.new(@new_resource.name)
          @current_resource.package_name(@new_resource.package_name)

          Chef::Log.debug("Checking apt-cache policy for #{@new_resource.package_name}")
          status = popen4("apt-cache policy #{@new_resource.package_name}") do |pid, stdin, stdout, stderr|
            stdout.each do |line|
              case line
              when /^\s{2}Installed: (.+)$/
                installed_version = $1
                if installed_version == '(none)'
                  Chef::Log.debug("Current version is nil")
                  @current_resource.version(nil)
                else
                  Chef::Log.debug("Current version is #{installed_version}")
                  @current_resource.version(installed_version)
                end
              when /^\s{2}Candidate: (.+)$/
                Chef::Log.debug("Current version is #{$1}")                
                @candidate_version = $1
              end
            end
          end

          unless status.exitstatus == 0
            raise Chef::Exceptions::Package, "apt-cache failed - #{status.inspect}!"
          end

          if @candidate_version == "(none)"
            raise Chef::Exceptions::Package, "apt does not have a version of package #{@new_resource.package_name}"
          end

          @current_resource
        end


        def install_package(name, version)
          run_command_with_system_locale(
            :command => "sudo apt-get -y -q #{expand_options(@new_resource.options)} install #{name}=#{version}",
            :environment => {
              "DEBIAN_FRONTEND" => "noninteractive"
            }
          )
        end
      end
    end
  end
end
