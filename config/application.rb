require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'dotenv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FoxyDashboard
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    config.paths.add File.join('app', 'workers'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'workers', '*')]

    config.paths.add File.join('app', 'features'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'features', '*')]

    config.paths.add File.join('controllers', 'api/v1'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('controllers', 'api/v1', '*')]
  end
end
