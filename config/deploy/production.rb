set :stage, :production
set :rails_env, :production
set :conditionally_migrate, true  

set :branch, :master

set :default_env, { :path => "$HOME/.gem/ruby/3.3/bin:$PATH" }

server 'appserv1.alb.glitchworks.net', user: 'rails_services', roles: %w{app db web}, my_property: :my_value

set :linked_files, %w{config/database.yml config/credentials/production.key}

after 'deploy', 'puma:restart'
