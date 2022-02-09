default[:base][:dodyndns][:package][:version] = '1.0.0'
default[:base][:dodyndns][:package][:url] = "https://github.com/jeroenj/dodyndns/releases/download/#{node[:base][:dodyndns][:package][:version]}/dodyndns-#{node[:base][:dodyndns][:package][:version]}.darwin-amd64"
default[:base][:dodyndns][:package][:checksum] = '320969ee4ae241f35dc1befefd9910bc418cf5013840fad39ff9999dcc0887bb'

default[:base][:dodyndns][:domain] = nil
default[:base][:dodyndns][:name] = node[:base][:hostname]
default[:base][:dodyndns][:digital_ocean_access_token] = nil
