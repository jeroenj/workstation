base_base_recursive_directory node[:base][:ssl][:path] do
  owner node[:base][:username]
  group node[:base][:group]
end

node[:base][:ssl][:certificates].each do |certificate|
  [:key, :crt].each do |type|
    file ::File.join(node[:base][:ssl][:path], "#{certificate[:name]}.#{type}") do
      content certificate[type]
      owner node[:base][:username]
      group node[:base][:group]
    end
  end
end
