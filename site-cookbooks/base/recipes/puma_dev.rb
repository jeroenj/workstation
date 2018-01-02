package 'puma/puma/puma-dev'

execute 'puma-dev -setup' do
  not_if "grep puma-dev /etc/resolver/#{node[:base][:puma_dev][:tld]}"
end

execute "puma-dev -install -d #{node[:base][:puma_dev][:tld]}" do
  user node[:base][:username]
  group node[:base][:group]
  not_if "test -e #{::File.join(ENV['HOME'], 'Library/LaunchAgents/io.puma.dev.plist')}"
end
