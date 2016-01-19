# include base::settings at the end of the run list to include settings

homebrew_cask 'cyberduck'

base_recursive_directory "#{ENV['HOME']}/Library/Application Support/Cyberduck/Bookmarks" do
  owner node[:base][:username]
  group node[:base][:group]
end

node[:base][:cyberduck][:bookmarks].each do |bookmark|
  template "#{ENV['HOME']}/Library/Application Support/Cyberduck/Bookmarks/#{bookmark[:nickname]}.duck" do
    source 'cyberduck/bookmark.duck.erb'
    variables(
      hostname: bookmark[:hostname],
      nickname: bookmark[:nickname],
      port: bookmark[:port],
      protocol: bookmark[:protocol],
      username: bookmark[:username]
    )
    owner node[:base][:username]
    group node[:base][:group]
  end
end
