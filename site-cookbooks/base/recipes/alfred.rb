# include base::settings at the end of the run list to include settings

homebrew_cask 'alfred'

if node[:base][:alfred][:license]
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
