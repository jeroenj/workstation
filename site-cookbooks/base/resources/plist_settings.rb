property :name, kind_of: String, name_property: true

action :create do
  config[:settings].each do |setting_entry, setting_value|
    plist "#{new_resource.name} - #{setting_entry}" do
      path plist_path
      entry setting_entry
      value setting_value
    end
  end
end

action_class do
  def config
    node[:base][new_resource.name][:plist_settings]
  end

  def plist_path
    config[:path] || "#{ENV['HOME']}/Library/Preferences/#{config[:domain]}.plist"
  end
end
