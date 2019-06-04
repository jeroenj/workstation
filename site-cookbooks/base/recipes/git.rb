cookbook_file "#{ENV['HOME']}/.gitignore" do
  source 'git/gitignore'
  owner node[:base][:username]
  group node[:base][:group]
end

base_recursive_directory "#{ENV['HOME']}/.git-templates/hooks" do
  owner node[:base][:username]
  group node[:base][:group]
end

cookbook_file "#{ENV['HOME']}/.git-templates/hooks/pre-commit" do
  source 'git/pre-commit'
  mode 0755
  owner node[:base][:username]
  group node[:base][:group]
end

cookbook_file "#{ENV['HOME']}/.oh-my-zsh/custom/git.zsh" do
  source 'git/git.zsh'
  only_if { Dir.exist? "#{ENV['HOME']}/.oh-my-zsh/custom" }
  owner node[:base][:username]
  group node[:base][:group]
end

template "#{ENV['HOME']}/.gitconfig" do
  source 'git/gitconfig.erb'
  owner node[:base][:username]
  group node[:base][:group]
end
