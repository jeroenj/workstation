package 'vim' do
  options '--without-ruby'
end

cookbook_file "#{ENV['HOME']}/.vimrc" do
  source 'vim/vimrc'
  owner node[:base][:username]
  group node[:base][:group]
end

git "#{ENV['HOME']}/.vim" do
  repository node[:base][:vim][:repository]
  action :sync
  checkout_branch 'master'
  enable_checkout false
  enable_submodules true
  user node[:base][:username]
  group node[:base][:group]
end
