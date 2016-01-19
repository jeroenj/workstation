include_recipe 'base::python'

base_pip 'subliminal'
base_pip 'colorlog'

directory "#{ENV['HOME']}/.config" do
  owner node[:base][:username]
  group node[:base][:group]
end

node[:base][:subliminal][:launch_agents].each do |launch_agent|
  base_plist "#{ENV['HOME']}/Library/LaunchAgents/#{launch_agent[:Label]}.plist" do
    content launch_agent
    owner node[:base][:username]
    group node[:base][:group]
  end
end
