module Parametrizer
  module Parsers
    class AcceptLanguageHeaderParser
      attr_accessor :header

      def initialize(header)
        @header = header
      end

      def parsed_header
        @parsed_header ||= header_fields.map(&method(:parse_header_field)).sort(&method(:by_quality)).map(&:first).compact
      rescue ArgumentError
        []
      end

      private

      def by_quality(left, right)
        quality_left, quality_right = left[1], right[1]
        quality_right <=> quality_left
      end

      def parse_header_field(language)
        locale, quality = language.split(';q=')
        raise ArgumentError, 'Not correctly formatted' unless valid_locale?(locale)

        [parse_locale(locale), parse_quality(quality)]
      end

      def header_fields
        header.to_s.gsub(/\s+/, '').split(',')
      end

      def valid_locale_regex
        /^[a-z\-0-9]+|\*$/i
      end

      def valid_locale?(locale)
        locale =~ valid_locale_regex
      end

      def match_country_regex
        /-[a-z0-9]+$/i
      end

      def parse_locale(locale)
        locale = locale.downcase.gsub(match_country_regex, &:upcase)
        locale = nil if locale == '*'
        locale
      end

      def parse_quality(quality)
        quality ? quality.to_f : 1.0
      end
    end
  end
end