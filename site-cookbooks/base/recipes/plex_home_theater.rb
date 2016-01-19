homebrew_cask 'plex-home-theater'

base_recursive_directory "#{ENV['HOME']}/Library/Application Support/Plex Home Theater/userdata" do
  owner node[:base][:username]
  group node[:base][:group]
end

template "#{ENV['HOME']}/Library/Application Support/Plex Home theater/userdata/guisettings.xml" do
  source 'plex_home_theater/guisettings.xml.erb'
  variables(
    device_name: node[:base][:hostname],
    myplex_token: node[:base][:plex_home_theater][:preferences][:myplex_token],
    myplex_username: node[:base][:plex_home_theater][:preferences][:myplex_username],
    version: node[:base][:plex_home_theater][:version]
  )
  owner node[:base][:username]
  group node[:base][:group]
end
