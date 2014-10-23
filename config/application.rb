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

    config.assets.enabled = true
    config.assets.compile = true
    # config.assets.precompile << /\A(?!active_admin).*\.(js|css)\z/
  end
end
