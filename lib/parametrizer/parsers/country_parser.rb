module Parametrizer
  module Parsers
    class CountryParser < Parametrizer::Parsers::AcceptLanguageHeaderParser
      def country
        return nil if parsed_header.empty?
        parsed_header.first.split('-').length == 2 ? parsed_header.first.split('-').last : nil
      end
    end
  end
end