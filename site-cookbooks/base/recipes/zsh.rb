package 'zsh'

execute 'Set default shell to zsh' do
  command "chsh -s /bin/zsh #{node[:base][:username]}"
  not_if { `printf $SHELL` == '/bin/zsh' }
end

cookbook_file "#{ENV['HOME']}/.profile" do
  source "zsh/profile"
  user node[:base][:username]
  group node[:base][:group]
end
