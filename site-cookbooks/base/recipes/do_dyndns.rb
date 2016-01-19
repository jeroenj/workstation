gem_package 'httparty'

app_path = ::File.join node[:base][:apps_path], 'do-dyndns'

directory app_path do
  recursive true
  owner node[:base][:username]
  group node[:base][:group]
end

git app_path do
  repository 'git@github.com:jeroenj/do-dyndns.git'
  reference 'master'
  action :checkout
  user node[:base][:username]
  group node[:base][:group]
end

file_path = ::File.join app_path, 'dns.rb'
execute 'Set do-dyndns TOKEN' do
  command "sed -ibak \"s/TOKEN = ''/TOKEN = '#{node[:base][:do_dyndns][:token]}'/g\" #{file_path}"
  only_if { system("grep \"TOKEN = ''\" #{file_path}") }
end

base_plist "/Library/LaunchDaemons/#{node[:base][:do_dyndns][:launch_daemon][:Label]}.plist" do
  content node[:base][:do_dyndns][:launch_daemon]
end
