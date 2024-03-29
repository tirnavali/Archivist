require_relative "boot"

require "rails/all"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Archivist
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Istanbul"
    config.active_storage.service = :local
    #config.cache_store = :memory_store, { size: 64.megabytes }

    # config.eager_load_paths << Rails.root.join("extras")

    config.active_record.async_query_executor= :global_thread_pool
    config.active_record.yaml_column_permitted_classes = [Date]

    
  end
end
