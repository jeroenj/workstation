base_plist_settings 'terminal'

file "#{ENV['HOME']}/.hushlogin" do
  owner node[:base][:username]
  group node[:base][:group]
end
