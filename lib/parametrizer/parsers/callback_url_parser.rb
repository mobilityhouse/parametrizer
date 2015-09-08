module Parametrizer
  module Parsers
    class CallbackUrlParser
      attr_accessor :call_back_url

      def initialize(request_params)
        @call_back_url = ( request_params['call_back_url'] =~ URI::regexp ).present? ? request_params['call_back_url'] : nil
      end
      
    end
  end
end