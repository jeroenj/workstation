include_recipe 'base::python'

app_path = ::File.join node[:base][:apps_path], 'plexconnect'

directory app_path do
  recursive true
  owner node[:base][:username]
  group node[:base][:group]
end

git app_path do
  repository 'git@github.com:iBaa/PlexConnect.git'
  action :sync
  revision node[:base][:plexconnect][:revision]
  user node[:base][:username]
  group node[:base][:group]
end

pem_path = ::File.expand_path(::File.join(app_path, node[:base][:plexconnect][:settings][:certfile]))
file pem_path do
  content node[:base][:plexconnect][:certificate] + node[:base][:plexconnect][:key]
  owner node[:base][:username]
  group node[:base][:group]
end

file pem_path.gsub(/pem\z/, 'cer') do
  content node[:base][:plexconnect][:certificate]
  owner node[:base][:username]
  group node[:base][:group]
end

template ::File.join(app_path, 'Settings.cfg') do
  source 'plexconnect/Settings.cfg.erb'
  variables(
    certfile: node[:base][:plexconnect][:settings][:certfile],
    hosttointercept: node[:base][:plexconnect][:settings][:hosttointercept],
    ip_pms: node[:base][:plexconnect][:settings][:ip_pms],
    logpath: node[:base][:plexconnect][:settings][:logpath]
  )
  owner node[:base][:username]
  group node[:base][:group]
end

template ::File.join(app_path, 'ATVSettings.cfg') do
  source 'plexconnect/ATVSettings.cfg.erb'
  variables(
    myplex_user: node[:base][:plexconnect][:settings][:myplex_user],
    myplex_auth: node[:base][:plexconnect][:settings][:myplex_auth],
    apple_tv_id: node[:base][:plexconnect][:settings][:apple_tv_id]
  )
  owner node[:base][:username]
  group node[:base][:group]
end

base_plist '/Library/LaunchDaemons/plexconnect.plist' do
  content node[:base][:plexconnect][:launch_daemon]
end
