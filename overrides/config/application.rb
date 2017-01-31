require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.helper false
      g.assets false
      g.view_specs false
    end

    config.lograge.formatter = Lograge::Formatters::Logstash.new
    config.lograge.logger = ActiveSupport::Logger.new(STDOUT)
    config.lograge.custom_options = lambda do |event|
      {
        session_id: event.payload[:session_id],
        request_ip: event.payload[:request_ip],
        referer: event.payload[:referer],
        user_id: event.payload[:user_id],
        params: event.payload[:params]
      }
    end
  end
end
