homebrew_cask 'plex-media-server'

base_plist "#{ENV['HOME']}/Library/LaunchAgents/plex-media-server.plist" do
  content node[:base][:plex_media_server][:launch_agent]
  owner node[:base][:username]
  group node[:base][:group]
end
