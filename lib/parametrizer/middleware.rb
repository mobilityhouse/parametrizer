module Parametrizer
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      oem = Parsers::OemParser.new(request.host).oem
      language = Parsers::LanguageParser.new(env['HTTP_ACCEPT_LANGUAGE']).language
      country = Parsers::CountryParser.new(env['HTTP_ACCEPT_LANGUAGE']).country

      request.update_param('oem', oem)
      request.update_param('language', language)
      request.update_param('country', country)

      @app.call(env)
    end
  end
end