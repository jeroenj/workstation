default[:base][:ruby] = {
  path: '/opt/rubies',
  rubies: %w(
    2.4.2
    2.4.1
    2.3.3
    2.3.1
    2.3.0
    2.2.2
    2.1.9
    2.0.0-p648
  ),
  default: '2.4.2',
  gems: [
    { name: 'bundler', version: '~> 1.16.0' },
    { name: 'bundler-audit', version: '~> 0.5.0' },
    { name: 'cheat' },
    { name: 'explain_shell' },
    { name: 'foreman' },
    { name: 'haml-lint' },
    { name: 'mysql2' },
    { name: 'pry', version: '~> 0.11.2' },
    { name: 'pry-byebug' },
    { name: 'puma', version: '~> 3.7.0' },
    { name: 'rubocop', version: '~> 0.48.1' }
  ],
  rubygems_version: '2.7.3'
}
