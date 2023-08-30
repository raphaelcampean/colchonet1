require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Colchonet
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # Set Time.zone default to the specified zone
    # and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of
    # tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'
    # The default locale is :en and all
    # translations from config/locales/*.rb,yml are auto loaded.
    # Rails.application.config.i18n.load_path
    # += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :"pt-BR"
  end
end

Colchonet::Application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope "(:locale)", locale: LOCALES do
    resources :rooms
    resources :users
  end
  
  get '/:locale' => 'home#index', locale: LOCALES
  root "home#index"
end
