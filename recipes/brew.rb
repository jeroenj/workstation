include_recipe 'homebrew'
include_recipe 'homebrew::install_formulas'

homebrew_tap 'homebrew/dupes'
homebrew_tap 'caskroom/cask'
homebrew_tap 'caskroom/versions'

package 'brew-cask'

elephant_recursive_directory '/usr/local/var/log' do
  owner node[:elephant][:username]
  group 'admin'
end
