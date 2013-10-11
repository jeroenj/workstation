default[:elephant][:logrotate][:files] = [
  {
    :filename => "#{ENV['HOME']}/Development/ruby/**/log/*.log",
    :owner_group => "#{node[:elephant][:username]}:staff",
    :mode => 644,
    :count => 0,
    :size => 2960,
    :when => '*',
    :flags => 'G'
  }
]
