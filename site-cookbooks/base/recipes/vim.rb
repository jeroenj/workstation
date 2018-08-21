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
  files_owner node[:base][:username]
  files_group node[:base][:group]
end

autoload_dir = "#{ENV['HOME']}/.local/share/nvim/site/autoload"

base_recursive_directory autoload_dir do
  owner node[:base][:username]
  group node[:base][:group]
end

remote_file "#{autoload_dir}/plug.vim" do
  source 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  user node[:base][:username]
  group node[:base][:group]
end
