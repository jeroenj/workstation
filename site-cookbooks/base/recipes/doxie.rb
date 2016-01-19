homebrew_cask 'doxie'

preferences_directory = "#{ENV['HOME']}/Library/Preferences/Apparent/Doxie"

base_recursive_directory preferences_directory do
  owner node[:base][:username]
  group node[:base][:group]
end

cookbook_file "#{preferences_directory}/Preferences.xml" do
  source 'doxie/Preferences.xml'
  owner node[:base][:username]
  group node[:base][:group]
end
