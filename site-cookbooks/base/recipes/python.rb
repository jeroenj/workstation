package 'python'

node[:base][:python][:pip][:packages].each do |pkg|
  base_pip pkg
end
