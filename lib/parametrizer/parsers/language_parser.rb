module Parametrizer
  module Parsers
    class LanguageParser < Parametrizer::Parsers::AcceptLanguageHeaderParser
      def language
        return nil if parsed_header.empty?
        parsed_header.first.split('-').first
      end
    end
  end
end