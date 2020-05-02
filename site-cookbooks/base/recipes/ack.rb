cookbook_file "#{ENV['HOME']}/.ackrc" do
  source 'ack/ackrc'
  owner node[:base][:username]
  group node[:base][:group]
end
