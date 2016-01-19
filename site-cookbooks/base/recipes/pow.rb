pow_installed = ::File.exist? '/usr/local/bin/pow'

package 'pow'

unless pow_installed
  # Homebrew does not take care of this (yet)
  # https://github.com/37signals/pow/issues/298
  pow_hosts = "#{ENV['HOME']}/Library/Application Support/Pow/Hosts"
  base_recursive_directory pow_hosts do
    owner node[:base][:username]
    group node[:base][:group]
  end
  link "#{ENV['HOME']}/.pow" do
    to pow_hosts
    owner node[:base][:username]
    group node[:base][:group]
  end

  execute 'pow --install-system'
  execute 'pow --install-local' do
    user node[:base][:username]
    group node[:base][:group]
  end
  execute 'launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist'
  execute 'launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist' do
    user node[:base][:username]
    group node[:base][:group]
  end
end
