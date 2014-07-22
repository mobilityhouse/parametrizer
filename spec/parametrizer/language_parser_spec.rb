require 'spec_helper'

describe Parametrizer::LanguageParser do
  subject { Parametrizer::LanguageParser.new(header).languages }

  context 'when header is malformed' do
    let(:header) { 'asdasd..,;asd ..,..,' }

    it 'returns empty array' do
      expect(subject).to eq []
    end
  end

  context 'when header is empty' do
    let(:header) { nil }

    it 'returns empty array' do
      expect(subject).to eq []
    end
  end

  context 'when header is correctly formatted' do
    let(:header) { 'pl-pl, en-US;q=0.6,es-419' }

    it 'returns array of languages' do
      expect(subject).to eq %w{pl-PL es-419 en-US}
    end
  end
end