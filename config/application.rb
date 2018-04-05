require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Asia/Manila'

    # Use the Rails default middleware stack (avoid the reduction that rails-api does)
    # config.api_only = false

    # Enable the asset pipeline
    config.assets.enabled = true

    config.secret_key_base = ENV['SECRET_KEY_BASE']
  end
end