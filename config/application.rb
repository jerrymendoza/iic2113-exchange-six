require_relative 'boot'

require 'rails/all'
require 'json'
Bundler.require(*Rails.groups)

module RepoBase
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/public/*', headers: :any, methods: :get
        resource '/api/*',
          headers: :any,
          expose: ['X-Page', 'X-PageTotal'],
          methods: [:get, :post, :patch, :put, :delete, :options]
      end
    end

    config.i18n.fallbacks = [:es, :en]
    config.i18n.default_locale = 'es-CL'
    config.assets.paths << Rails.root.join('node_modules')
    config.load_defaults 6.0

  end
end
