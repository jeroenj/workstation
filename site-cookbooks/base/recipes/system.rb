include_recipe 'mac_os_x::settings'

execute 'Show library' do
  command "chflags nohidden #{ENV['HOME']}/Library"
  user node[:base][:username]
  group node[:base][:group]
  only_if { `stat #{ENV['HOME']}/Library` =~ /0x8000 #{ENV['HOME'].gsub /\//, '\/'}\/Library/ }
end

directory "#{ENV['HOME']}/Downloads/About Downloads.lpdf" do
  recursive true
  owner node[:base][:username]
  group node[:base][:group]
  action :delete
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
