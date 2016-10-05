default[:base][:chruby] = {
  path: '/opt/rubies',
  rubies: %w(
    2.3.1
    2.3.0
    2.2.2
    2.1.9
    2.0.0-p648
  ),
  default: '2.3.1',
  gems: [
    { name: 'bundler', version: '~> 1.13.2' },
    { name: 'bundler-audit', version: '~> 0.5.0' },
    { name: 'cheat' },
    { name: 'explain_shell' },
    { name: 'foreman' },
    { name: 'haml-lint' },
    { name: 'mysql2' },
    { name: 'powder', version: '~> 0.3.0' },
    { name: 'pry', version: '~> 0.10.0' },
    { name: 'pry-byebug' },
    { name: 'rubocop', version: '~> 0.35' }
  ]
}
