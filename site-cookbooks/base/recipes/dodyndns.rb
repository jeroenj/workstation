remote_file '/usr/local/bin/dodyndns' do
  source node[:base][:dodyndns][:package][:url]
  checksum node[:base][:dodyndns][:package][:checksum]
  mode '0755'
end

base_plist '/Library/LaunchDaemons/dodyndns.plist' do
  content({
    'Label' => 'dodyndns',
    'EnvironmentVariables' => {
      'DIGITALOCEAN_ACCESS_TOKEN' => node[:base][:dodyndns][:digital_ocean_access_token]
    },
    'ProgramArguments' => [
      '/usr/local/bin/dodyndns',
      '--domain',
      node[:base][:dodyndns][:domain],
      '--name',
      node[:base][:dodyndns][:name]
    ],
    'StartCalendarInterval' => {
      'Minute' => 0
    },
    'ProcessType' => 'Background',
    'StandardErrorPath' => '/Library/Logs/dodyndns.log',
    'StandardOutPath' => '/Library/Logs/dodyndns.log'
  })
end
