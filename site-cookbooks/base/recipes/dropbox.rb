homebrew_cask 'dropbox'

link "#{ENV['HOME']}/Development" do
  to "#{ENV['HOME']}/Dropbox/Development"
  owner node[:base][:username]
  group node[:base][:group]
end
