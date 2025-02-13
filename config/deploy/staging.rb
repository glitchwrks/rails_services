set :stage, :production
set :rails_env, :production
set :conditionally_migrate, true  

set :branch, :puma_upgrade

set :default_env, { :path => "$HOME/.gem/ruby/3.3/bin:$PATH" }

server 'staging.bee.glitchworks.net', user: 'rails_services', roles: %w{app db web}, my_property: :my_value

set :linked_files, %w{config/database.yml config/credentials/production.key}

before 'deploy:assets:precompile', 'configure:development_credentials'

after 'deploy', 'puma:restart'
