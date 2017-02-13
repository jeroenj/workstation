homebrew_cask 'chefdk'

chef_gem 'knife-solo'

link "#{ENV['HOME']}/.chef" do
  to "#{ENV['HOME']}/Development/openminds/chef-scripts/chef-dotfiles"
  owner node[:base][:username]
  group node[:base][:group]
end

# Disabled as ~/.chef is managed by the Openminds repository.
# directory "#{ENV['HOME']}/.chef" do
#   owner node[:base][:username]
#   group node[:base][:group]
# end
#
# %w(client.pem client.pub validation.pem).each do |filename|
#   file "#{ENV['HOME']}/.chef/#{filename}" do
#     content node[:base][:chef][filename.sub(/\./, '_')]
#     mode 0600
#     owner node[:base][:username]
#     group node[:base][:group]
#   end
# end
#
# template "#{ENV['HOME']}/.chef/knife.rb" do
#   source 'chef/knife.rb.erb'
#   variables({
#     cookbook_copyright: node[:base][:chef][:knife][:cookbook_copyright],
#     cookbook_email: node[:base][:chef][:knife][:cookbook_email],
#     cookbook_path: node[:base][:chef][:knife][:cookbook_path],
#     node_name: node[:base][:chef][:knife][:node_name]
#   })
#   owner node[:base][:username]
#   group node[:base][:group]
# end
