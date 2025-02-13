# config valid only for current version of Capistrano
lock "3.19.2"

set :application, 'rails_services'
set :repo_url, 'git@github.com:glitchwrks/rails_services.git'
set :deploy_to, '/home/rails_services/rails_services'
set :keep_releases, 2

# Defaults to web only
set :assets_roles, [:web, :app]

# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
set :rails_assets_groups, :assets

# # We're storing in a subdir currently
# set :assets_prefix, 'ng/assets'

namespace :puma do
  desc 'Restart Puma via rc-script' 
  task :restart do  
    on roles(:web) do
      execute 'doas /etc/rc.d/counters restart'
    end  
  end
end
