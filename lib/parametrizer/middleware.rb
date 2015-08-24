module Parametrizer
  class Middleware
    attr_accessor :request

    def initialize(app)
      @app = app

    end

    def call(env)
      @request = Rack::Request.new(env)
      
      oem = Parsers::OemParser.new(request.host).oem
      request.update_param('oem', oem)
      
      wallbox_session = Parsers::WallboxSessionParser.new(request.params).wallbox_session
      request.update_param('wallbox_session_id', wallbox_session)
      
      car_identifier = Parsers::CarIdentifierParser.new(request.params).car_identifier
      request.update_param('car_identifier', car_identifier)
      
      call_back_url = Parsers::CallbackUrlParser.new(request.params).call_back_url
      request.update_param('call_back_url', call_back_url)
      
      if locale_present_in_cookies?
        language, country = read_from_cookies
      else
        language = Parsers::LanguageParser.new(env['HTTP_ACCEPT_LANGUAGE']).language
        country = Parsers::CountryParser.new(env['HTTP_ACCEPT_LANGUAGE']).country
      end

      unless locale_present_in_request?
        request.update_param('language', language)
        request.update_param('country', country)
      end

      @app.call(env)
    end

    private
    def locale_present_in_request?
      request.params.key?('language') || request.params.key?('country')
    end

    def locale_present_in_cookies?
      !request.cookies['country'].nil? || !request.cookies['language'].nil?
    end

    def read_from_cookies
      [request.cookies['language'], request.cookies['country']]
    end
  end
end