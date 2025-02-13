require_relative 'boot'

require "rails"

# Pull in only the bits we want
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsServices
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers

    # Autoload services
    config.autoload_paths += Dir["#{Rails.root}/app/services"]

    # Enable flash messages, these will be on the request since we're not using sessions
    config.middleware.use ActionDispatch::Flash

    # Disable cookies, we don't use them here
    config.middleware.delete ActionDispatch::Cookies
    config.middleware.delete ActionDispatch::Session::CookieStore

    # No session, so don't bother with CSRF tokens
    config.action_controller.allow_forgery_protection = false

    config.active_record.primary_key = :uuid

    # Opt in to Rails 8.1 timezone behavior
    config.active_support.to_time_preserves_timezone = :zone
  end
end
