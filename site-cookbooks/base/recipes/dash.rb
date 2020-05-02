base_plist_settings 'dash'

node.default[:base][:dash_license][:plist_settings] = {
  path: "#{ENV['HOME']}/Library/Application Support/Dash/License/license.dash-license",
  settings: {
    'Product' => node[:base][:dash][:license][:product],
    'Name' => node[:base][:dash][:license][:name],
    'Email' => node[:base][:dash][:license][:email],
    'Licenses' => node[:base][:dash][:license][:licenses],
    'Timestamp' => node[:base][:dash][:license][:timestamp],
    'Version' => node[:base][:dash][:license][:version],
    'TransactionID' => node[:base][:dash][:license][:transaction_id],
    'Signature' => node[:base][:dash][:license][:signature]
  }
}

if node[:base][:dash][:license][:signature]
  base_recursive_directory "#{ENV['HOME']}/Library/Application Support/Dash/License" do
    owner node[:base][:username]
    group node[:base][:group]
  end

  template "#{ENV['HOME']}/Library/Application Support/Dash/License/license.dash-license" do
    source 'dash/license.dash-license.erb'
    owner node[:base][:username]
    group node[:base][:group]
  end
end
