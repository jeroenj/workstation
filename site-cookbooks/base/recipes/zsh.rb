template "#{ENV['HOME']}/.profile" do
  source 'zsh/profile.erb'
  user node[:base][:username]
  group node[:base][:group]
end
