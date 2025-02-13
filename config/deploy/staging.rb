set :stage, :production
set :rails_env, :production
set :conditionally_migrate, true  

set :branch, :puma_migration

set :default_env, { :path => "$HOME/.gem/ruby/3.3/bin:$PATH" }

server 'staging.bee.glitchworks.net', user: 'rails_services', roles: %w{app db web}, my_property: :my_value

set :linked_files, %w{config/database.yml config/production.key}

after 'deploy', 'unicorn:restart'
