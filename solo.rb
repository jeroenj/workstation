pwd = Pathname.pwd

cookbook_path [pwd.join('berks-cookbooks').to_s, pwd.join('site-cookbooks').to_s]
role_path pwd.join('roles').to_s
data_bag_path pwd.join('data_bags').to_s
json_attribs pwd.join('node.json').to_s
file_cache_path pwd.join('.chef/local-mode-cache').to_s
file_backup_path pwd.join('.chef/local-mode-cache/backup').to_s
log_level :info
log_location pwd.join('/var/log/chef.log')

Chef::Client.send(:define_method, :save_updated_node) { Chef::Log.debug("Skipping final node save because it is monkeypatched in solo.rb.") }
