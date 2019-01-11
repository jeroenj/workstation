default[:mac_os_x][:settings_user] = node[:base][:username]
default[:base][:system][:remote_login] = true
default[:base][:system][:wake_on_network_access] = true
default[:base][:system][:restart_power_failure] = false

default[:mac_os_x][:settings][:global] = {
  'domain' => 'NSGlobalDomain',
  'AppleInterfaceStyle' => 'Dark',
  'com.apple.sound.beep.feedback' => 1,
  'NSAllowContinuousSpellChecking' => false,
  'NSDocumentSaveNewDocumentsToCloud' => false,
  'NSNavPanelExpandedStateForSaveMode' => true,
  'NSNavPanelExpandedStateForSaveMode2' => true,
  'PMPrintingExpandedStateForPrint' => true,
  'PMPrintingExpandedStateForPrint2' => true
}

default[:mac_os_x][:settings][:keyboard] = {
  'domain' => '.GlobalPreferences',
  'KeyRepeat' => 2,
  'InitialKeyRepeat' => 15
}

default[:mac_os_x][:settings][:light_sensor] = {
  'domain' => '/Library/Preferences/com.apple.iokit.AmbientLightSensor',
  'Automatic Display Enabled' => false
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

default[:base][:trackpad_builtin][:plist_settings] = {
  domain: 'com.apple.AppleMultitouchTrackpad',
  settings: {
    'Clicking' => true,
    'Dragging' => 0,
    'DragLock' => 0,
    'TrackpadCornerSecondaryClick' => 0,
    'TrackpadFiveFingerPinchGesture' => 2,
    'TrackpadFourFingerHorizSwipeGesture' => 2,
    'TrackpadFourFingerPinchGesture' => 2,
    'TrackpadFourFingerVertSwipeGesture' => 2,
    'TrackpadHorizScroll' => 1,
    'TrackpadMomentumScroll' => true,
    'TrackpadPinch' => 1,
    'TrackpadRightClick' => true,
    'TrackpadRotate' => 1,
    'TrackpadScroll' => true,
    'TrackpadThreeFingerDrag' => false,
    'TrackpadThreeFingerHorizSwipeGesture' => 0,
    'TrackpadThreeFingerTapGesture' => 2,
    'TrackpadThreeFingerVertSwipeGesture' => 0,
    'TrackpadTwoFingerDoubleTapGesture' => 1,
    'TrackpadTwoFingerFromRightEdgeSwipeGesture' => 3,
    'UserPreferences' => true
  }
}

default[:base][:trackpad_external][:plist_settings] = {
  domain: 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
  settings: node[:base][:trackpad_builtin][:plist_settings][:settings]
}
