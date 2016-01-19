package 'tig'

cookbook_file "#{ENV['HOME']}/.tigrc" do
  source 'tig/tigrc'
  owner node[:base][:username]
  group node[:base][:group]
end
