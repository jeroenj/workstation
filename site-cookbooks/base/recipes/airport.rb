cmd = '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport prefs'

node[:base][:airport][:prefs].each do |key, value|
  pref = "#{key}=#{value}"

  execute "airport #{pref}" do
    command "#{cmd} #{pref}"
    not_if "#{cmd} | grep #{pref}"
  end
end
