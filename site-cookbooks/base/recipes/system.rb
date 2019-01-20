%w(global_domain light_sensor login network_storage trackpad_builtin trackpad_external).each do |settings_name|
  base_plist_settings settings_name
end

execute 'Show library' do
  command "chflags nohidden #{ENV['HOME']}/Library"
  user node[:base][:username]
  group node[:base][:group]
  only_if { `stat #{ENV['HOME']}/Library` =~ /0x8000 #{ENV['HOME'].gsub /\//, '\/'}\/Library/ }
end

services = {
  remote_login: 'remotelogin',
  wake_on_network_access: 'wakeonnetworkaccess',
  restart_power_failure: 'restartpowerfailure'
}

services.each do |key, value|
  if node[:base][:system][key]
    execute "Enable #{key.to_s.gsub /_/, ' '}" do
      command "systemsetup -set#{value} on"
      user node[:base][:username]
      group node[:base][:group]
      only_if "systemsetup -get#{value} | grep Off"
    end
  end
end
