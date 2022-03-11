# TODO

## Settings
* Alllow "Full Disk Access" (Security & Privacy) for Terminal.app and iTerm.app
* rename `base_plist_settings` to `base_settings`
* add support for dictionaries

## System
* create `/Users/jeroen/Library/LaunchAgents/`

### Accessibility
* Zoom settings

### Dock
* Only restart Dock if actual changes happened in Dock settings

### Firewall

### Screensaver
* `'idleTime' => 300`
* Select screensaver:
```
'muduleDict' =>
  'moduleName': 'Flurry',
  'path': '/System/Library/Screen Savers/Flurry.saver',
  'type': 0`
```

### Keyboard Shortcuts
* Set as `NSUserKeyEquivalents` in app settings?
* Map Tabs lock to escape
* Disable ^ up/down
* Enable ^1 to switch to desktop 1
* Disable spotlight shortcuts
* Add Mail shortcuts:
  * Send: CMD + enter
  * Archive: CMD + shift + S

### Preferences
* Click in the scrollbar to: Jump to the spot that's clicked
* Show bluetooth icon
* Show speaker icon
* Show battery percentage
* Require password after 15 minutes of sleep # TODO: always on laptop
* Disable "Automatically rearange space on most recent use"
* Disable "Automatically adjust brightness"

### Services
* Screen sharing

## System apps

### Contacts
* Sorting
* Hide groups

### Finder
* Only restart Finder if actual changes happened in Finder settings
* Hide Tags

### Music
* All settings

### Mail
* Inbox notifications: VIP Inbox
* Dock count: VIP Inbox

### Safari
* Extensions
  * Ghostery

### Terminal
* Preferences

## Third party apps

### Moom
* preferences?

### Reeder
* `"#{ENV['HOME']}/Library/Containers/com.reederapp.macOS/Data/Library/Preferences/com.reederapp.macOS.plist"`
* All preferences (they are all dictionaries)

### Zoom
* preferences:
  * disable enter full screen automatically
  * automatically join audio
  * mute mic
  * turn of video when joining
