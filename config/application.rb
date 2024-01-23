require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # protect_from_forgery with: :exception
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    
      # other configurations
      # config.middleware.use ActionDispatch: :Cookies
      # config.middleware.use ActionDispatch: :Session: :CookieStore
      # config.middleware.use ActionDispatch: :CSRFProtection
      # ...
    
    
    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end