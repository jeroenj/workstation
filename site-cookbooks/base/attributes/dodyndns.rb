default[:base][:dodyndns][:package][:version] = '0.1.1'
default[:base][:dodyndns][:package][:url] = "https://github.com/jeroenj/dodyndns/releases/download/#{node[:base][:dodyndns][:package][:version]}/dodyndns-#{node[:base][:dodyndns][:package][:version]}.darwin-amd64"
default[:base][:dodyndns][:package][:checksum] = '06fe637ce6a177178143828ceee9ee4caa14992036f8e43781552b7ca564320f'

default[:base][:dodyndns][:domain] = nil
default[:base][:dodyndns][:name] = node[:base][:hostname]
default[:base][:dodyndns][:digital_ocean_access_token] = nil
