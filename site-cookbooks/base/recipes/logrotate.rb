template '/etc/newsyslog.d/custom.conf' do
  source 'logrotate/custom.conf.erb'
  variables files: node[:base][:logrotate][:files]
  mode 0644
end
