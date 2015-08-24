module Parametrizer
  module Parsers
    class CallbackUrlParser
      attr_accessor :call_back_url

      def initialize(request_params)
        @call_back_url = request_params['call_back_url']
      end
      
    end
  end
end