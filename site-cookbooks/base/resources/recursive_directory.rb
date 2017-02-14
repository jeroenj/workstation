property :path, kind_of: String, name_property: true
property :owner, kind_of: String, default: nil
property :group, kind_of: String, default: nil
property :parent, kind_of: String

def initialize name, run_context = nil
  super
  @parent ||= case path
              when /\/usr\/local\/.*/ then '/usr/local'
              when /#{ENV['HOME']}\/Library\/Application Support\/.*/ then "#{ENV['HOME']}/Library/Application Support"
              when /#{ENV['HOME']}\/Library\/Preferences\/.*/ then "#{ENV['HOME']}/Library/Preferences"
              when /#{ENV['HOME']}\/.*/ then ENV['HOME']
  end
  @parent ||= '/usr' if path =~ /\/usr.*/
end

action :create do
  path = Pathname.new(new_resource.path)

  until path.to_s == new_resource.parent
    directory "#{path} for #{new_resource.path}" do
      path path.to_s
      owner new_resource.owner
      group new_resource.group
      recursive true
    end
    path = path.parent
  end
end
