include_recipe 'macos'

node[:base][:plist_settings].each do |settings_name, app_settings|
  plist_path = "/Users/#{node[:base][:username]}/Library/Preferences/#{app_settings[:domain]}.plist"

  app_settings[:settings].each do |setting_entry, setting_value|
    plist "#{settings_name} - #{setting_entry}" do
      path plist_path
      entry setting_entry
      value setting_value
    end
  end
end
