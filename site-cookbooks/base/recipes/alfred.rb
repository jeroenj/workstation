homebrew_cask 'alfred'

base_plist_settings 'alfred'

if node[:base][:alfred][:license][:code]
  directory "#{ENV['HOME']}/Library/Application Support/Alfred 3" do
    owner node[:base][:username]
    group node[:base][:group]
  end

  template "#{ENV['HOME']}/Library/Application Support/Alfred 3/license.plist" do
    source 'alfred/license.plist.erb'
    owner node[:base][:username]
    group node[:base][:group]
  end
end
