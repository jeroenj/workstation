package 'neovim'

config_dir = "#{ENV['HOME']}/.config/nvim"

base_recursive_directory ::File.join(config_dir, 'ftplugin') do
  owner node[:base][:username]
  group node[:base][:group]
end

remote_directory config_dir do
  source 'vim/config'
  owner node[:base][:username]
  group node[:base][:group]
end

dein_dir = "#{ENV['HOME']}/.local/share/dein/repos/github.com/Shougo/dein.vim"

base_recursive_directory dein_dir do
  owner node[:base][:username]
  group node[:base][:group]
end

git dein_dir do
  repository 'https://github.com/Shougo/dein.vim'
  action :checkout
  checkout_branch 'master'
  enable_checkout false
  user node[:base][:username]
  group node[:base][:group]
end
