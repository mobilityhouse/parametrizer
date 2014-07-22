module Parametrizer
  class OemParser
    attr_accessor :server_name

    def initialize(server_name)
      @server_name = server_name
    end

    def oem
      return nil unless server_name_ends_with?(".#{Parametrizer.configuration.base_host}")
      server_name.sub(Parametrizer.configuration.base_host, '').split('.').last
    rescue ArgumentError
      nil
    end

    private
    def server_name_ends_with?(suffix)
      server_name[-suffix.length, suffix.length] == suffix
    end
  end
end