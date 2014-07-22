module Parametrizer
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      oem = OemParser.new(env['SERVER_NAME']).oem
      languages = LanguageParser.new(env['HTTP_ACCEPT_LANGUAGE']).languages

      env['action_dispatch.request.request_parameters'] ||= {}
      env['action_dispatch.request.request_parameters']['oem'] = oem
      env['action_dispatch.request.request_parameters']['languages'] = languages

      @app.call(env)
    end
  end
end