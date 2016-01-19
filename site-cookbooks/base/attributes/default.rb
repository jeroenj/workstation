default[:base][:username] = 'jeroen'
default[:base][:uid] = `id -u #{node[:base][:username]}`
default[:homebrew][:owner] = node[:base][:username]
default[:base][:group] = 'staff'
default[:base][:apps_path] = "#{ENV['HOME']}/apps"
