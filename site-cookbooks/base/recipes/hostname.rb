%w(ComputerName LocalHostName HostName).each do |type|
  execute "Set #{type} to #{node[:base][:hostname]}" do
    command "scutil --set #{type} #{node[:base][:hostname]}"
    not_if { `scutil --get #{type}`.strip == node[:base][:hostname] }
  end
end
