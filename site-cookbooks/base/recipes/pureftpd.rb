package 'pure-ftpd'

base_base_recursive_directory node[:base][:pureftpd][:log_file] do
  owner node[:base][:username]
  group node[:base][:group]
end

base_plist '/Library/LaunchDaemons/pureftpd.plist' do
  content node[:base][:pureftpd][:launch_daemon]
end

template '/usr/local/etc/pureftpd.passwd' do
  source 'pureftpd/pureftpd.passwd.erb'
  variables accounts: node[:base][:pureftpd][:accounts]
  owner node[:base][:username]
  group node[:base][:group]
  notifies :run, 'execute[Update pureftpd database]'
end

execute 'Update pureftpd database' do
  command 'pure-pw mkdb'
  user node[:base][:username]
  group node[:base][:group]
  action :nothing
end
