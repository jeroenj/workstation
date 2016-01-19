default[:base][:do_dyndns] = {
  launch_daemon: {
    'Label' => 'do-dyndns',
    'ProgramArguments' => [
      '/usr/bin/ruby',
      "#{ENV['HOME']}/apps/do-dyndns/dns.rb",
      'jeroenj.be',
      node[:base][:hostname].downcase
    ],
    'StartCalendarInterval' => {
      'Minute' => 0
    },
    'ProcessType' => 'Background',
    'StandardErrorPath' => '/Library/Logs/dnsupdate-ruby.log',
    'StandardOutPath' => '/Library/Logs/dnsupdate-ruby.log'
  }
}
