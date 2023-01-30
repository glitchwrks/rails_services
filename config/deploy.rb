# config valid only for current version of Capistrano
lock "3.17.1"

set :application, 'rails_services'
set :repo_url, 'git@github.com:glitchwrks/rails_services.git'
set :deploy_to, '/home/services/rails_services'
set :keep_releases, 2

set :rvm_type, :user
set :rvm_ruby_version, '3.1.3@rails_services'

# Defaults to web only
set :assets_roles, [:web, :app]

# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
set :rails_assets_groups, :assets

# We're storing in a subdir currently
set :assets_prefix, 'ng/assets'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
