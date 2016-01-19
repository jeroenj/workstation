# include base::settings at the end of the run list to include settings

file "#{ENV['HOME']}/.hushlogin" do
  owner node[:base][:username]
  group node[:base][:group]
end
