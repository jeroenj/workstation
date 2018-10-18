property :name, kind_of: String, name_property: true

action :create do
  config[:settings].each do |setting_entry, setting_value|
    plist "#{new_resource.name} - #{setting_entry}" do
      path plist_path
      entry setting_entry
      value setting_value
    end
  end

  file "#{new_resource.name} plist ownership" do
    path plist_path
    owner node[:base][:username]
    group node[:base][:group]
    only_if { user_file? }
  end
end

action_class do
  def config
    node[:base][new_resource.name][:plist_settings]
  end

  def plist_path
    if config[:container]
      "#{ENV['HOME']}/Library/Containers/#{config[:container]}/Data/Library/Preferences/#{config[:container]}.plist"
    elsif config[:domain]
      "#{ENV['HOME']}/Library/Preferences/#{config[:domain]}.plist"
    else
      config[:path]
    end
  end

  def user_file?
    plist_path.start_with?(ENV['HOME'])
  end
end
