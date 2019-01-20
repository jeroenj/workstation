default[:base][:drobo][:settings_path] = "#{ENV['HOME']}/Library/Application Support/Drobo Dashboard"
default[:base][:drobo][:plist_settings] = {
  path: ::File.join(node[:base][:drobo][:settings_path], 'Appclicks/appclicks.plist'),
  settings: {
    'ACCleanQuit' => true,
    'ACEnableService' => false,
    'ACExistingUser' => true
  }
}
