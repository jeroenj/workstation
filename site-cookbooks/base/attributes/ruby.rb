default[:base][:ruby] = {
  path: '/opt/rubies',
  rubies: %w(
    2.7.0
    2.6.5
    2.4.9
  ),
  default: '2.6.5',
  gems: [
    { name: 'bundler', version: '~> 1.17.3' },
    { name: 'bundler-audit', version: '~> 0.6.1' },
    { name: 'explain_shell' },
    { name: 'foreman' },
    { name: 'pry', version: '~> 0.12.2' },
    { name: 'rubocop', version: '~> 0.48.1' }
  ]
}
