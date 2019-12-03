# TODO

## Settings
* move from `node[:base][:settings]` to `base_plist_settings`
* remove `mac_os_x` cookbook

## System

* create `/Users/jeroen/Library/LaunchAgents/`
* Show Volume and BlueTooth icons

### Accessibility
* Zoom settings

### Dock
* Only restart Dock if actual changes happened in Dock settings

### Firewall

### Language & Region
* Advanced: change separators to spaces for groupping and `.` for decimals

### Screensaver
* `'idleTime' => 300`
* Select screensaver:
```
'muduleDict' =>
  'moduleName': 'Flurry',
  'path': '/System/Library/Screen Savers/Flurry.saver',
  'type': 0`
```

### Siri
* languages
* remove icon from menu bar and dock

### Keyboard
* Disable autocorrect

### Keyboard Shortcuts
Set as `NSUserKeyEquivalents` in app settings?

* Disable F11/F12
* Disable ^ up/down
* Enable ^1 to switch to desktop 1
* Disable spotlight shortcuts
* Add Mail shortcuts:
  * Send: CMD + enter
  * Archive: CMD + shift + S

### Preferences
* Click in the scrollbar to: Jump to the spot that's clicked
* OSX Dark theme
* Show bluetooth icon
* Show speaker icon
* Show battery percentage
* Enable screen sharing
* Require password after 15 minutes of sleep

### Ruby
* Make it possible to use gem_package when running a ruby managed by chruby: https://github.com/Atalanta/chef-chruby/issues/5#issuecomment-23155795

### Services
* Screen sharing

## System apps

### Calendar
* Hide new events count in Dock
* Don't include Mail.app events

### Contacts
* Sorting

### Finder
* Only restart Finder if actual changes happened in Finder settings

### Image Capture
* Connecting an iPhone does not open any apps

### iTunes
* All settings
* Disable song notifications
* Show status bar

### Mail
* `'DefaultViewState': {'FavoritesBarVisible' => false}`
* Enable rules
* Signatures
* Inbox notifications: VIP Inbox
* Dock count: VIP Inbox
* Customize toolbar

### Safari
* Extensions
  * Ghostery

### Terminal
* Preferences
* ALT + backspace

## Third party apps

### 1Password
* Disable "Verify browser code signature" => Not implemented since this is a "secure" setting
* Auto submit after filling
* Install Safari Extension
* Install Chrome Extension
* Extension preferences
```ruby
remote_file "#{ENV['HOME']}/Library/Safari/Extensions/1Password.safariextz" do
  action :create_if_missing
  backup false
  source "http://aws.cachefly.net/dist/1P/ext/1Password.safariextz"
end

mac_os_x_userdefaults "Install 1Password Safari extension" do
  domain "#{ENV['HOME']}/Library/Safari/Extensions/Extensions.plist"
  sudo false
  key "Installed Extensions"
  value [{
    "Archive File Name" => "!Password-1.safariextz",
    "Bundle Directory Name" => "1Password.safariextension",
    "Enabled" => true
  }]
end

# In attributes:

default[:mac_os_x][:settings][:'1password_extension'] = {
  'domain' => "#{ENV['HOME']}/Library/Safari/Extensions/Extensions.plist",
  "Installed Extensions" => [
    {
      "Archive File Name" => "!Password-1.safariextz",
      "Bundle Directory Name" => "1Password.safariextension",
      "Enabled" => true
    }
  ]
}
```

### Adobe Reader
* Create recipe
* disable updates
* do not set as default reader
* Remove browser plugin
  * rm /Library/Internet Plug-Ins/AdobePDFViewer.plugin
  * rm /Library/Internet Plug-Ins/AdobePDFViewerNPAPI.plugin

### AppCleaner
* SmartDelete

### Dash
* Docsets:
  * Bootstrap
  * Ruby
  * Ruby_2 (ruby2)
  * Ruby_on_Rails
  * RubyMotion
  * Ruby on Rails 2.3 (rails2) (https://raw.github.com/jipumarino/rails-2.3-docset/master/feed/Rails2.3.xml)

### Divvy
* Set "Enable access for assistive devices" in Universal Access in System Preferences
* Shortcuts: http://mizage.clarify-it.com/d/nxr9qg

### Google Chrome
* Preferences

### Reeder
* `"#{ENV['HOME']}/Library/Containers/com.reederapp.rkit2.mac/Data/Library/Preferences/com.reederapp.rkit2.mac.plist"`
* All preferences (they are all dictionaries)

### Spotify
* Disable launch on login

### TeamViewer
* Preferences
```ruby
mac_os_x_userdefaults 'com.teamviewer.teamviewer' do
  key 'Always_Online'
  value 0
end

%w[teamviewer teamviwer_desktop].each do |type|
  plist = "/Library/LaunchAgents/com.teamviewer.#{type}.plist"

  # execute "Unload #{plist}" do
  #   command "sudo launchctl unload #{plist}"
  #   ignore_failure true
  # end

  mac_os_x_userdefaults plist do
    key 'Disabled'
    value true
    sudo true
  end
end
```

### Tunnelblick
* Preferences
* Configs

## Various
* Notification settings

* Audio Hijack Pro
* Color Picker Pro
* Fission
* Sketch

* Pixelmator
* Renamer
* Skitch
* The Unarchiver

* TextEdit
* Time Machine

* Fonts

## Chef
* Debug timeout issues. Currently the timeout is set to 10 minutes, but sometimes compiling a package exeeds that time.
* Debug why installing a lot of packages after each other takes such a long time. Note: during that time Dropbox was syncing and using 100% CPU.
* create keychain lwrp instead of doing custom calls. This way STDOUT output can easily be ignored and we could to ask to unlock the keychain if it is locked instead of always doing that.
