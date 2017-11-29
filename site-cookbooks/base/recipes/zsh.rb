package 'zsh'

execute 'Set default shell to zsh' do
  command "chsh -s /bin/zsh #{node[:base][:username]}"
  not_if { `printf $SHELL` == '/bin/zsh' }
end

template "#{ENV['HOME']}/.profile" do
  source 'zsh/profile.erb'
  variables chef_env: node[:base][:chef][:client][:default_environment]
  user node[:base][:username]
  group node[:base][:group]
end
