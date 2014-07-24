require 'spec_helper'

describe Parametrizer::Parsers::OemParser do
  subject { Parametrizer::Parsers::OemParser.new(server_name).oem }

  before do
    Parametrizer.configure do |config|
      config.base_host = 'test.com'
    end
  end

  context 'when there is no oem' do
    let(:server_name) { 'test.com' }

    it 'returns nil' do
      expect(subject).to eq nil
    end
  end

  context 'when oem is the only subdomain' do
    let(:server_name) { 'texaco.test.com' }

    it 'returns correct oem' do
      expect(subject).to eq 'texaco'
    end
  end

  context 'when oem has subdomains' do
    let(:server_name) { 'alaska.texaco.test.com' }

    it 'returns correct oem' do
      expect(subject).to eq 'texaco'
    end
  end

  context 'when server name does not contain host' do
    let(:server_name) { 'texaco.test2.com' }

    it 'returns nil' do
      expect(subject).to eq nil
    end
  end
end