if node[:base][:vpn][:l2tp_enabled]
  execute 'Set L2TP VPN secret in keychain' do
    command "security add-generic-password -a com.apple.ppp.l2tp -s com.apple.net.racoon -T /usr/sbin/racoon -w #{node[:base][:vpn][:l2tp_secret]} /Library/Keychains/System.keychain"
    not_if { system 'security find-generic-password -a com.apple.ppp.l2tp > /dev/null' }
  end
end

template '/Library/Preferences/SystemConfiguration/com.apple.RemoteAccessServers.plist' do
  source 'vpn/com.apple.RemoteAccessServers.plist.erb'
  variables(
    pptp_enabled: node[:base][:vpn][:pptp_enabled],
    l2tp_enabled: node[:base][:vpn][:l2tp_enabled],
    dns_servers: node[:base][:vpn][:dns_servers],
    ip_range: node[:base][:vpn][:ip_range],
    log_file: node[:base][:vpn][:log_file]
  )
end

template '/etc/ppp/chap-secrets' do
  source 'vpn/chap-secrets.erb'
  variables(
    chap_secrets: node[:base][:vpn][:chap_secrets]
  )
  mode 0600
end

node[:base][:vpn][:launch_daemons].each do |type, content|
  if node[:base][:vpn][:"#{type}_enabled"]
    launch_daemon = "/Library/LaunchDaemons/#{content[:Label]}.plist"

    base_plist launch_daemon do
      content content
    end
  end
end
