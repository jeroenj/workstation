homebrew_cask 'drobo-dashboard'

base_plist_settings 'drobo'

file "#{ENV['HOME']}/.Drobo_Dashboard_installer_os_version_check_log.txt" do
  action :delete
end

cookbook_file ::File.join(node[:base][:drobo][:settings_path], 'settings.xml') do
  source 'drobo/settings.xml'
  owner node[:base][:username]
  group node[:base][:group]
  action :create_if_missing
end
