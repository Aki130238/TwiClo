server '18.176.21.168', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/akira/.ssh/id_rsa'
