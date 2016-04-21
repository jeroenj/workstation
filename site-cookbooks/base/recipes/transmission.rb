homebrew_cask 'transmission'

execute 'Set remote access password' do
  command "security unlock #{ENV['HOME']}/Library/Keychains/login.keychain && security add-generic-password -a Remote -s Transmission:Remote -T /Applications/Transmission.app -w #{node[:base][:transmission][:remote_access_password]} #{ENV['HOME']}/Library/Keychains/login.keychain"
  sensitive true
  not_if 'security find-generic-password -s Transmission:Remote > /dev/null 2>&1'
end
