require "parametrizer/version"
require "parametrizer/configuration"
require "parametrizer/parsers/accept_language_header_parser"
require "parametrizer/parsers/language_parser"
require "parametrizer/parsers/country_parser"
require "parametrizer/parsers/oem_parser"
require "parametrizer/parsers/wallbox_session_parser"
require "parametrizer/parsers/car_identifier_parser"
require "parametrizer/parsers/callback_url_parser"
require "parametrizer/middleware"
require "active_support/core_ext/string"

module Parametrizer
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset_configuration
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end