homebrew_cask 'sabnzbd'

if node[:base][:sabnzbd][:preferences]
  settings_path = "#{ENV['HOME']}/Library/Application Support/SABnzbd"
  scripts_path = ::File.expand_path 'scripts', settings_path

  base_recursive_directory scripts_path do
    owner node[:base][:username]
    group node[:base][:group]
  end

  template ::File.expand_path('sabnzbd.ini', settings_path) do
    source 'sabnzbd/sabnzbd.ini.erb'
    variables(
      username: node[:base][:sabnzbd][:preferences][:username],
      password: node[:base][:sabnzbd][:preferences][:password],
      api_key: node[:base][:sabnzbd][:preferences][:api_key],
      https: node[:base][:sabnzbd][:preferences][:https],
      https_port: node[:base][:sabnzbd][:preferences][:https_port],
      https_key: node[:base][:sabnzbd][:preferences][:https_key],
      https_cert: node[:base][:sabnzbd][:preferences][:https_cert],
      osx_speed: node[:base][:sabnzbd][:preferences][:osx_speed],
      schedule: node[:base][:sabnzbd][:preferences][:schedule],
      servers: node[:base][:sabnzbd][:preferences][:servers],
      tv: node[:base][:sabnzbd][:tv],
      movies: node[:base][:sabnzbd][:movies]
    )
    owner node[:base][:username]
    group node[:base][:group]
  end

  if node[:base][:sabnzbd][:tv] || node[:base][:sabnzbd][:movies]
    if node[:base][:sabnzbd][:tv]
      %w(autoProcessTV.py sabToSickBeard.py).each do |file|
        link ::File.expand_path(file, scripts_path) do
          to ::File.join(node[:base][:apps_path], 'sickbeard/autoProcessTV', file)
          owner node[:base][:username]
          group node[:base][:group]
        end
      end

      template ::File.expand_path('autoProcessTV.cfg', scripts_path) do
        source 'sabnzbd/autoProcessTV.cfg.erb'
        variables(
          host: node[:base][:sabnzbd][:tv][:sickbeard][:host],
          port: node[:base][:sabnzbd][:tv][:sickbeard][:port],
          username: node[:base][:sabnzbd][:tv][:sickbeard][:username],
          password: node[:base][:sabnzbd][:tv][:sickbeard][:password],
          ssl: node[:base][:sabnzbd][:tv][:sickbeard][:ssl]
        )
        owner node[:base][:username]
        group node[:base][:group]
      end
    end

    if node[:base][:sabnzbd][:movies]
      template ::File.expand_path('update_plex_movies.sh', scripts_path) do
        source 'sabnzbd/update_plex_movies.sh.erb'
        variables(
          plex_movies_id: node[:base][:sabnzbd][:movies][:plex_movies_id]
        )
        mode 0755
        owner node[:base][:username]
        group node[:base][:group]
      end
    end
  end
end

if node[:base][:sabnzbd][:launch_agent]
  base_plist "#{ENV['HOME']}/Library/LaunchAgents/sabnzbd.plist" do
    content node[:base][:sabnzbd][:launch_agent]
    owner node[:base][:username]
    group node[:base][:group]
  end
end
