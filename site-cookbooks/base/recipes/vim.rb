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
