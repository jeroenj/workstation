template "#{ENV['HOME']}/.profile" do
  source 'zsh/profile.erb'
  variables chef_env: node[:base][:chef][:client][:default_environment]
  user node[:base][:username]
  group node[:base][:group]
end
