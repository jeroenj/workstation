homebrew_cask 'chefdk'

environments_path = "#{ENV['HOME']}/.chef/environments"

base_recursive_directory "#{ENV['HOME']}/.chef/environments" do
  owner node[:base][:username]
  group node[:base][:group]
end

node[:base][:chef][:client][:environments].each do |name, options|
  environment_path = ::File.join(environments_path, name)

  directory environment_path do
    owner node[:base][:username]
    group node[:base][:group]
  end

  file ::File.join(environment_path, 'client.pem') do
    content options['private_key']
    owner node[:base][:username]
    group node[:base][:group]
    mode 0600
    sensitive true
  end

  if options['public_key']
    file ::File.join(environment_path, 'client.pub') do
      content options['public_key']
      owner node[:base][:username]
      group node[:base][:group]
    end
  end

  file ::File.join(environment_path, 'config.yml') do
    content options.select { |key| %w(server node_name environment cookbook_path copyright email).include?(key) }.to_yaml
    owner node[:base][:username]
    group node[:base][:group]
  end
end

template "#{ENV['HOME']}/.chef/config.rb" do
  source 'chef/config.rb.erb'
  variables default_chef_environment: node[:base][:chef][:client][:default_environment]
  owner node[:base][:username]
  group node[:base][:group]
end
