package 'tmux'

# Fix copy-paste on macOS Sierra
package 'reattach-to-user-namespace'

cookbook_file "#{ENV['HOME']}/.tmux.conf" do
  source 'tmux/tmux.conf'
  owner node[:base][:username]
  group node[:base][:group]
end
