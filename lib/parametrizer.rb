require "parametrizer/version"
require "parametrizer/configuration"
require "parametrizer/language_parser"
require "parametrizer/oem_parser"
require "parametrizer/middleware"

module Parametrizer
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end