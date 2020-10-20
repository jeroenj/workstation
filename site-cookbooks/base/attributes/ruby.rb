default[:base][:ruby] = {
  path: '/opt/rubies',
  rubies: %w(
    2.7.0
    2.6.5
    2.4.9
  ),
  default: '2.6.5',
  gems: [
    { name: 'foreman' },
    { name: 'pry', version: '~> 0.13.1' },
  ]
}
