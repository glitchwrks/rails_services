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

# No asset manifests
Rake::Task["deploy:assets:backup_manifest"].clear_actions

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

namespace :configure do
  desc 'Run with development credentials in production'
  task :development_credentials do
    on roles(:app) do
      execute "/bin/mv #{File.join(release_path, 'config/credentials/development.yml.enc')} #{File.join(release_path, 'config/credentials/production.yml.enc')}"
    end
  end
end
