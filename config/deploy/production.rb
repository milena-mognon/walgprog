set :stage, :production

server '178.128.121.4', roles: %w[app web db], primary: true, user: 'deployer'
set :rails_env, 'production'