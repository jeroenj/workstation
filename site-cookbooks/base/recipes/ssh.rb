directory "#{ENV['HOME']}/.ssh" do
  owner node[:base][:username]
  group node[:base][:group]
end

private_key = node[:base][:ssh][:private_key]
public_key = node[:base][:ssh][:public_key]
authorized_keys = node[:base][:ssh][:authorized_keys]

if private_key && public_key
  file "#{ENV['HOME']}/.ssh/id_ed25519" do
    content private_key
    mode 00600
    owner node[:base][:username]
    group node[:base][:group]
  end

  file "#{ENV['HOME']}/.ssh/id_ed25519.pub" do
    content public_key
    mode 00644
    owner node[:base][:username]
    group node[:base][:group]
  end
end

if authorized_keys.any?
  file "#{ENV['HOME']}/.ssh/authorized_keys" do
    content ([public_key] + authorized_keys).compact.join("\n")
    mode 00644
    owner node[:base][:username]
    group node[:base][:group]
  end
end
