include_recipe 'mac_os_x::settings'

execute 'Show library' do
  command "chflags nohidden #{ENV['HOME']}/Library"
  only_if { `stat #{ENV['HOME']}/Library` =~ /0x8000 #{ENV['HOME'].gsub /\//, '\/'}\/Library/}
end

directory "#{ENV['HOME']}/Downloads/About Downloads.lpdf" do
  recursive true
  action :delete
end

services = {
  :remote_login => 'remotelogin',
  :wake_on_network_access => 'wakeonnetworkaccess'
}

services.each do |key, value|
  if node[:elephant][:system][key]
    execute "Enable #{key.to_s.gsub /_/, ' '}" do
      command "systemsetup -set#{value} on"
      only_if "systemsetup -get#{value} | grep Off"
    end
  end
end
