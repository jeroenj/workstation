%w(gemrc irbrc pryrc spring.rb).each do |file|
  cookbook_file "#{ENV['HOME']}/.#{file}" do
    source "ruby/#{file}"
    owner node[:base][:username]
    group node[:base][:group]
  end
end
