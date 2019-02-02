default[:base][:ruby] = {
  path: '/opt/rubies',
  rubies: %w(
    2.5.3
    2.4.5
    2.3.7
    2.1.9
    2.0.0-p648
  ),
  default: '2.5.3',
  gems: [
    { name: 'bundler', version: '~> 1.17.3' },
    { name: 'bundler-audit', version: '~> 0.6.1' },
    { name: 'explain_shell' },
    { name: 'foreman' },
    { name: 'pry', version: '~> 0.12.2' },
    { name: 'rubocop', version: '~> 0.48.1' }
  ],
  rubygems_version: '2.7.8'
}
