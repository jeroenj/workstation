node[:base][:resilio][:sync_directories].each do |name, dir|
  base_recursive_directory dir[:path] do
    owner node[:base][:username]
    group node[:base][:group]
  end

  if dir[:options]
    sync_path = ::File.join(dir[:path], '.sync')

    directory sync_path do
      owner node[:base][:username]
      group node[:base][:group]
    end

    if dir[:options][:ignore]
      file ::File.join(sync_path, 'IgnoreList') do
        content((node[:base][:resilio][:sync][:ignore] + dir[:options][:ignore]).join("\n"))
        owner node[:base][:username]
        group node[:base][:group]
      end
    end
  end
end
