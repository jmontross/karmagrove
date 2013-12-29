require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Karmagrove
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    #  for heroku to precompile for us...
    config.assets.initialize_on_precompile = false

    # The above needs to be true I think..... Joshua .. images are not serving.
    # http://stackoverflow.com/questions/9095249/undefined-mixin-global-reset-when-deploying-to-heroku
    # config.assets.initialize_on_precompile = false
    # config.assets.precompile += %w( my.css )


    # config.clear_javascripts!
    # config.clear_stylesheets!

  #   config.register_javascript 'active_admin/admin.js'
  #   config.register_stylesheet 'active_admin/admin.css'

  # # register plugin js/css, located in vendor/assets
  #   config.register_javascript 'plugin/plugin.js'
  #   config.register_stylesheet 'plugin/style.css'

    config.serve_static_assets = true
    # config.assets.compile = true
    config.assets.precompile += %w( purchases.js *.js *.css *.js.coffee purchases.js.coffee active_admin.css active_admin.js )


    # config.assets.precompile

    # Use SQL instead of Active Record's schema dumper when creating the database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.assets.precompile += %w(admin/active_admin.css admin/active_admin.js)
    config.assets.precompile += %w( frontend.css frontend.js active_admin.css active_admin.js _base.css base.css)
    config.assets.precompile << /\A(?!active_admin).*\.(js|css)\z/
    # Rails.application.assets.each_logical_path { |asset_path| puts asset_path if precompile.any? { |rule| rule === asset_path } }; nil
  end
end
