require 'spec_helper'

describe Parametrizer::Parsers::CountryParser do
  subject { Parametrizer::Parsers::CountryParser.new(header).country }

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

  context 'when header does not contain country information' do
    let(:header) { 'pl, en' }

    it 'returns nil' do
      expect(subject).to eq nil
    end
  end

  context 'when header is correctly formatted' do
    let(:header) { 'pl-PL, en-US;q=0.6,es-419' }

    it 'returns first language from header' do
      expect(subject).to eq "PL"
    end
  end
end