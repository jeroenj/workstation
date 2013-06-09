default[:mac_os_x][:settings][:global] = {
  'domain' => 'NSGlobalDomain',
  'NSDocumentSaveNewDocumentsToCloud' => false
}


default[:mac_os_x][:settings][:clock] = {
  'domain' => 'com.apple.menuextra.clock',
  'DateFormat' => 'EEE d MMM  HH:mm'
}

default[:mac_os_x][:settings][:dock] = {
  'domain' => 'com.apple.dock',
  'largesize' => 80,
  'showhidden' => true,
  'tilesize' => 48
}

default[:mac_os_x][:settings][:screensaver] = {
  'domain' => 'com.apple.screensaver',
  'askForPasswordDelay' => 3600
}

default[:mac_os_x][:settings][:terminal] = {
  'domain' => 'com.apple.terminal',
  'Default Window Wettings' => 'Pro',
  'Startup Window Wettings' => 'Pro'
}

default[:mac_os_x][:settings][:time_machine] = {
  'domain' => 'com.apple.systempreferences',
  'TMShowUnsupportedNetworkVolumes' => true
}

default[:mac_os_x][:settings][:trackpad] = {
  'domain' => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
  'Clicking' => true,
  'TrackpadFourFingerPinchGesture' => 2,
  'TrackpadThreeFingerHorizSwipeGesture' => 0,
  'TrackpadThreeFingerVertSwipeGesture' => 0
}


