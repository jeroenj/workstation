default[:base][:ruby] = {
  path: '/opt/rubies',
  rubies: %w(
    2.7.1
    2.6.6
  ),
  default: '2.6.6',
  gems: [
    { name: 'foreman' },
    { name: 'pry', version: '~> 0.13.1' },
  ]
}
