package 'chruby'
package 'ruby-install'

directory node[:base][:chruby][:path] do
  owner node[:base][:username]
  group node[:base][:group]
end

node[:base][:chruby][:rubies].each do |ruby|
  name = "ruby-#{ruby}"
  path = ::File.join node[:base][:chruby][:path], name

  cmd = "ruby-install --install-dir #{path} --src-dir /tmp ruby #{ruby}"

  execute "Install ruby #{ruby}" do
    command cmd
    user node[:base][:username]
    group 'admin'
    not_if { ::File.exist? path }
  end

  node[:base][:chruby][:gems].each do |ruby_gem|
    gem_exec = "source /usr/local/opt/chruby/share/chruby/chruby.sh && RUBIES=(#{path}) && chruby #{ruby} && #{::File.join path, 'bin/gem'}"
    version = " --version '#{ruby_gem[:version]}'" if ruby_gem[:version]
    description_version = " #{ruby_gem[:version]}" if ruby_gem[:version]

    execute "Install #{ruby_gem[:name]}#{description_version} on ruby #{ruby}" do
      command "#{gem_exec} install #{ruby_gem[:name]}#{version}"
      user node[:base][:username]
      group node[:base][:group]
      not_if { system({ 'UID' => node[:base][:uid], 'GEM_PATH' => '' }, "#{gem_exec} list #{ruby_gem[:name]} --installed#{version} > /dev/null") }
    end
  end
end

file "#{ENV['HOME']}/.ruby-version" do
  content node[:base][:chruby][:default]
  owner node[:base][:username]
  group node[:base][:group]
end

if node[:recipes].include?('base::pow')
  template "#{ENV['HOME']}/.powconfig" do
    source 'chruby/powconfig'
    owner node[:base][:username]
    group node[:base][:group]
  end
end
