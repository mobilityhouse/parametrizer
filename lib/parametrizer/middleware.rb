module Parametrizer
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      oem = Parsers::OemParser.new(Rack::Request.new(env).host).oem
      language = Parsers::LanguageParser.new(env['HTTP_ACCEPT_LANGUAGE']).language
      country = Parsers::CountryParser.new(env['HTTP_ACCEPT_LANGUAGE']).country

      env['action_dispatch.request.request_parameters'] ||= {}
      env['action_dispatch.request.request_parameters']['oem'] = oem
      env['action_dispatch.request.request_parameters']['language'] = language
      env['action_dispatch.request.request_parameters']['country'] = country

      @app.call(env)
    end
  end
end