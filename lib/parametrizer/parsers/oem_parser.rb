module Parametrizer
  module Parsers
    class OemParser
      attr_accessor :server_name

      def initialize(server_name)
        @server_name = server_name
      end

      def oem
        return nil unless server_name.ends_with?(".#{Parametrizer.configuration.base_host}")
        server_name.sub(Parametrizer.configuration.base_host, '').split('.').last
      rescue ArgumentError
        nil
      end
    end
  end
end