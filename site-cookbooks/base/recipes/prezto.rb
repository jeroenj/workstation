include_recipe 'base::zsh'

git "#{ENV['HOME']}/.zprezto" do
  repository node[:base][:prezto][:url]
  action :sync
  enable_submodules true
  user node[:base][:username]
  group node[:base][:group]
end

%w(zlogin zlogout zpreztorc zprofile zshenv zshrc).each do |file|
  link "#{ENV['HOME']}/.#{file}" do
    to "#{ENV['HOME']}/.zprezto/runcoms/#{file}"
    user node[:base][:username]
    group node[:base][:group]
  end
end
