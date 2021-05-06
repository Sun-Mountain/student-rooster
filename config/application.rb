require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StudentRooster
  class Application < Rails::Application
    # ump and read as sql
    config.active_record.schema_format = :sql

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Asset path
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # field_with_errors support, avoid that nasty line break on errors
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
