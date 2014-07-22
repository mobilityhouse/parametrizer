module Parametrizer
  class LanguageParser
    attr_accessor :header

    def initialize(header)
      @header = header
    end

    def languages
      header.to_s.gsub(/\s+/, '').split(',').map do |language|
        locale, quality = language.split(';q=')
        raise ArgumentError, 'Not correctly formatted' unless locale =~ /^[a-z\-0-9]+|\*$/i

        locale  = locale.downcase.gsub(/-[a-z0-9]+$/i, &:upcase)
        locale  = nil if locale == '*'

        quality = quality ? quality.to_f : 1.0

        [locale, quality]
      end.sort do |(_, left), (_, right)|
        right <=> left
      end.map(&:first).compact
    rescue ArgumentError
      []
    end
  end
end