default[:base][:'1password'][:plist_settings] = {
  container: 'com.agilebits.onepassword-osx',
  settings: {
    'CompletedEssentialSettings' => true,
    'Enable3rdPartyIntegration' => true,
    'HashSectionIsSortedFirst' => true,
    'KeepHelperRunning' => true,
    'LockOnIdle' => true,
    'LockOnUserSwitch' => true,
    'LockTimeout' => 5,
    'PasswordAllowRepeats' => false,
    'PasswordAvoidAmbiguous' => true,
    'PasswordDigits' => 2,
    'PasswordLength' => 24,
    'PasswordPronounceable' => false,
    'PasswordSymbols' => 0,
    'ShowItemCounts' => true,
    'ShowRichIcons' => true,
    'ShowStatusItem' => true,
    'WelcomeWindowShown' => true
  }
}
