homebrew_cask 'alfred2'

base_plist_settings 'alfred'

if node[:base][:alfred][:license][:code]
  directory "#{ENV['HOME']}/Library/Application Support/Alfred 2" do
    owner node[:base][:username]
    group node[:base][:group]
  end

  template "#{ENV['HOME']}/Library/Application Support/Alfred 2/license.plist" do
    source 'alfred/license.plist.erb'
    owner node[:base][:username]
    group node[:base][:group]
  end
end
