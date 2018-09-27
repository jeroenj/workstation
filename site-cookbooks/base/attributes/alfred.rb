default[:base][:alfred][:license][:code] = nil
default[:base][:alfred][:license][:email] = nil

default[:base][:plist_settings][:alfred] = {
  domain: 'com.runningwithcrayons.Alfred-Preferences',
  settings: {
    'features.clipboard.enabled' => true,
    'syncfolder' => '~/Library/Mobile Documents/com~apple~CloudDocs/Preferences'
  }
}
