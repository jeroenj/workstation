package 'wakeonlan'

directory "#{ENV['HOME']}/.wakeonlan" do
  owner node[:base][:username]
  group node[:base][:group]
end

node[:base][:wakeonlan][:devices].each do |name, device|
  file "#{ENV['HOME']}/.wakeonlan/#{name}" do
    content [device[:mac_address], device[:host], device[:port]].compact.join(' ')
    owner node[:base][:username]
    group node[:base][:group]
  end
end
