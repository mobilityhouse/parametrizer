require 'spec_helper'

describe Parametrizer::Parsers::LanguageParser do
  subject { Parametrizer::Parsers::LanguageParser.new(header).language }

  context 'when header is malformed' do
    let(:header) { 'asdasd..,;asd ..,..,' }

    it 'returns nil' do
      expect(subject).to eq nil
    end
  end

  context 'when header is empty' do
    let(:header) { nil }

    it 'returns nil' do
      expect(subject).to eq nil
    end
  end

  context 'when header is correctly formatted' do
    let(:header) { 'pl-pl, en-US;q=0.6,es-419' }

    it 'returns first language from header' do
      expect(subject).to eq "pl"
    end
  end
end