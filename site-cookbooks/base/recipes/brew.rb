include_recipe 'homebrew'

taps = %w(
  caskroom/cask
  caskroom/eid
  caskroom/versions
)

taps.each do |tap|
  homebrew_tap tap
end

base_recursive_directory '/usr/local/var/log' do
  owner node[:base][:username]
  group 'admin'
end

include_recipe 'homebrew::install_formulas'
