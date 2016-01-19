default[:base][:pureftpd] = {
  accounts: [],
  log_file: '/usr/local/var/log/pure-ftpd.log'
}

default[:base][:pureftpd][:launch_daemon] = {
  'Label' => 'pureftpd',
  'ProgramArguments' => [
    '/usr/local/sbin/pure-ftpd',
    '--syslogfacility',
    'none',
    '--altlog',
    "clf:#{node[:base][:pureftpd][:log_file]}",
    '--chrooteveryone',
    '--login',
    'puredb:/usr/local/etc/pureftpd.pdb'
  ],
  'RunAtLoad' => true,
  'KeepAlive' => true,
  'WorkingDirectory' => '/usr/local/var',
  'StandardErrorPath' => node[:base][:pureftpd][:log_file],
  'StandardOutPath' => node[:base][:pureftpd][:log_file]
}
