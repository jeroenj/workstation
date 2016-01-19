package 'postgresql'

link "#{ENV['HOME']}/Library/LaunchAgents/homebrew.mxcl.postgresql.plist" do
  to '/usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist'
  owner node[:base][:username]
  group node[:base][:group]
end
