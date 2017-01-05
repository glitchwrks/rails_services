# set path to application
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"
working_directory app_dir


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "/var/www/run/unicorn/rails_services.sock", :backlog => 64

# Logging
stderr_path "/var/log/unicorn/rails_services.stderr.log"
stdout_path "/var/log/unicorn/rails_services.stdout.log"

# Set master PID location
pid "/var/run/unicorn/rails_services.pid"