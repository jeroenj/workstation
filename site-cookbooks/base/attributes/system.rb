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

default[:mac_os_x][:settings][:login] = {
  'domain' => '/Library/Preferences/com.apple.loginwindow',
  'GuestEnabled' => true
}

default[:mac_os_x][:settings][:network_storage] = {
  'domain' => '/Library/Preferences/com.apple.desktopservices',
  'DSDontWriteNetworkStores' => true
}

default[:mac_os_x][:settings][:time_machine] = {
  'domain' => 'com.apple.systempreferences',
  'TMShowUnsupportedNetworkVolumes' => true
}

default[:mac_os_x][:settings][:trackpad] = {
  'domain' => 'com.apple.AppleMultitouchTrackpad',
  'Clicking' => true,
  'Dragging' => 0,
  'DragLock' => false,
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

default[:mac_os_x][:settings][:wireless_trackpad] = node[:mac_os_x][:settings][:trackpad].merge(
  'domain' => 'com.apple.driver.AppleBluetoothMultitouch.trackpad'
)
