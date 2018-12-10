homebrew_cask 'dash'

base_plist_settings 'dash'

if node[:base][:dash][:license][:signature]
  directory "#{ENV['HOME']}/Library/Application Support/Dash/License" do
    owner node[:base][:username]
    group node[:base][:group]
  end

  template "#{ENV['HOME']}/Library/Application Support/Dash/License/license.dash-license" do
    source 'dash/license.dash-license.erb'
    owner node[:base][:username]
    group node[:base][:group]
  end
end
