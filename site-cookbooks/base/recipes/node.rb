package 'node'

node[:base][:node][:packages].each do |package|
  execute "npm install -g #{package}" do
    user node[:base][:username]
    group node[:base][:group]
    not_if "npm list #{package} version -g --silent > /dev/null"
  end
end
