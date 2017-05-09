include_recipe 'homebrew'

base_recursive_directory '/usr/local/var/log' do
  owner node[:base][:username]
  group 'admin'
end

include_recipe 'homebrew::install_taps'
include_recipe 'homebrew::install_formulas'
