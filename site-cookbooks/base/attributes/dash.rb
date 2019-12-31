default[:base][:dash][:license][:product] = 'Dash'
default[:base][:dash][:license][:name] = nil
default[:base][:dash][:license][:email] = nil
default[:base][:dash][:license][:licenses] = 1
default[:base][:dash][:license][:timestamp] = nil
default[:base][:dash][:license][:apple_order_id] = nil
default[:base][:dash][:license][:version] = nil
default[:base][:dash][:license][:signature] = nil

default[:base][:dash][:plist_settings] = {
  domain: 'com.kapeli.dashdoc',
  settings: {
    'automaticallyUpdate' => true,
    'DHNotificationDocsetPressEnterOrClickIconTip' => true,
    'DHNotificationFindTip' => true,
    'DHNotificationNestedResultTip' => true,
    'DHNotificationProfiles' => true,
    'DHNotificationTableOfContentsTip' => true,
    'didFirstRun' => true,
    'syncFolderPath' => "#{ENV['HOME']}/Library/Mobile Documents/com~apple~CloudDocs/Preferences"
  }
}
