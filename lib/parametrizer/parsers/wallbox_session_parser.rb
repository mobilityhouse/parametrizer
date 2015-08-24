module Parametrizer
  module Parsers
    class WallboxSessionParser
      attr_accessor :wallbox_session

      def initialize(request_params)
        @wallbox_session = request_params['wallbox_session_id']
      end

    end
  end
end