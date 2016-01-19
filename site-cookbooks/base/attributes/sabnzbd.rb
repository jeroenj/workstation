default[:base][:sabnzbd][:preferences][:https] = 0
default[:base][:sabnzbd][:preferences][:https_port] = 9090
default[:base][:sabnzbd][:preferences][:https_key] = '""'
default[:base][:sabnzbd][:preferences][:https_cert] = '""'
default[:base][:sabnzbd][:preferences][:osx_speed] = 0
default[:base][:sabnzbd][:preferences][:schedule] = []
default[:base][:sabnzbd][:preferences][:servers] = []

default[:base][:sabnzbd][:launch_agent] = {
  'Label' => 'sabnzbd',
  'Program' => "#{ENV['HOME']}/Applications/SABnzbd.app/Contents/MacOS/SABnzbd",
  'RunAtLoad' => true,
  'KeepAlive' => {
    'SuccessfulExit' => false
  }
}
