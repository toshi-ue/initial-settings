require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Webapp
  class Application < Rails::Application

    config.load_defaults 5.1

    # locale
    config.i18n.available_locales = [ :en, :ja ]
    # default locale
    config.i18n.default_locale = :ja

    config.time_zone = 'Tokyo'
    # change db time_zone
    config.active_record.default_timezone = :local

    # Don't generate system test files.
    config.generators.system_tests = nil

    # RSpec generator setting
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: true
        # 20-05-17-ジェネレータはない
        # system_specs: true
    end
  end
end
