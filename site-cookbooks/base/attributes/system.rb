default[:base][:system][:remote_login] = true
default[:base][:system][:wake_on_network_access] = true
default[:base][:system][:restart_power_failure] = false

default[:base][:global_domain][:plist_settings] = {
  domain: '.GlobalPreferences',
  settings: {
    'AppleInterfaceStyle' => 'Dark',
    'com.apple.sound.beep.feedback' => 1,
    'InitialKeyRepeat' => 15,
    'KeyRepeat' => 2,
    'NSAutomaticCapitalizationEnabled' => false,
    'NSAutomaticPeriodSubstitutionEnabled' => false,
    'NSAutomaticSpellingCorrectionEnabled' => false,
    'WebAutomaticSpellingCorrectionEnabled' => false
  }
}

default[:base][:light_sensor][:plist_settings] = {
  path: '/Library/Preferences/com.apple.iokit.AmbientLightSensor.plist',
  settings: {
    'Automatic Display Enabled' => false
  }
}

default[:base][:login][:plist_settings] = {
  path: '/Library/Preferences/com.apple.loginwindow.plist',
  settings: {
    'GuestEnabled' => true
  }
}

default[:base][:network_storage][:plist_settings] = {
  path: '/Library/Preferences/com.apple.desktopservices.plist',
  settings: {
    'DSDontWriteNetworkStores' => true
  }
}

default[:base][:trackpad][:plist_settings] = {
  domain: 'com.apple.AppleMultitouchTrackpad',
  settings: {
    'Clicking' => true
  }
}
