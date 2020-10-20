%w(gemrc irbrc spring.rb).each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
    owner node[:base][:username]
    group node[:base][:group]
  end
end

package 'chruby'
package 'ruby-install'

directory node[:base][:ruby][:path] do
  owner node[:base][:username]
  group node[:base][:group]
end

node[:base][:ruby][:rubies].each do |ruby|
  name = "ruby-#{ruby}"
  path = ::File.join(node[:base][:ruby][:path], name)

  cmd = "ruby-install --install-dir #{path} --src-dir /tmp ruby #{ruby}"

  execute "Install ruby #{ruby}" do
    command cmd
    user node[:base][:username]
    group 'admin'
    not_if { ::File.exist? path }
  end

  gem_exec = "source /usr/local/opt/chruby/share/chruby/chruby.sh && RUBIES=(#{path}) && chruby #{ruby} && #{::File.join(path, 'bin/gem')}"

  node[:base][:ruby][:gems].each do |ruby_gem|
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
  content node[:base][:ruby][:default]
  owner node[:base][:username]
  group node[:base][:group]
end
