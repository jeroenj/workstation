package 'puma/puma/puma-dev'

execute 'puma-dev -setup' do
  not_if 'grep puma-dev /etc/resolver/dev'
end

execute 'puma-dev -install' do
  user node[:base][:username]
  group node[:base][:group]
  not_if "test -e #{::File.join(ENV['HOME'], 'Library/LaunchAgents/io.puma.dev.plist')}"
end
