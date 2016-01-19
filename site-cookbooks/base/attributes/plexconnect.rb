default[:base][:plexconnect][:revision] = 'v0.3.1'
default[:base][:plexconnect][:path] = ::File.join node[:base][:apps_path], 'plexconnect'

default[:base][:plexconnect] = {
  settings: {
    hosttointercept: 'trailers.apple.com'
  },
  launch_daemon: {
    'Label' => 'plexconnect',
    'ProgramArguments' => [
      '/usr/local/bin/python',
      "#{node[:base][:plexconnect][:path]}/PlexConnect.py"
    ],
    'StandardErrorPath' => "#{ENV['HOME']}/Library/Logs/plexconnect.error.log",
    'StandardOutPath' => "#{ENV['HOME']}/Library/Logs/plexconnect.access.log",
    'WorkingDirectory' => node[:base][:plexconnect][:path],
    'RunAtLoad' => true,
    'KeepAlive' => true
  }
}
