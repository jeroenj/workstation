pwd = Pathname.pwd

cookbook_path pwd.join('cookbooks')
role_path pwd.join('roles')
data_bag_path pwd.join('data_bags')
json_attribs pwd.join('node.json')
