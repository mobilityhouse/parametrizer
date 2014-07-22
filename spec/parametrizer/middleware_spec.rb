require 'spec_helper'
require 'rack'

describe Parametrizer::Middleware do
  let(:app) { ->(env) { [200, env, "app"] } }
  let(:middleware) { Parametrizer::Middleware.new(app) }

  before do
    Parametrizer.configure do |config|
      config.base_host = 'test.com'
    end
  end

  it 'puts language in params' do
    code, env = middleware.call env_for('http://texaco.test.com', 'HTTP_ACCEPT_LANGUAGE' => 'en-US;q=0.6')

    expect(code).to eq 200
    expect(env['action_dispatch.request.request_parameters']['languages']).to eq %w{en-US}
  end

  it 'puts subdomain in params' do
    code, env = middleware.call env_for('http://texaco.test.com')
    expect(code).to eq 200
    expect(env['action_dispatch.request.request_parameters']['oem']).to eq 'texaco'
  end

  def env_for(url, opts = {})
    Rack::MockRequest.env_for(url, opts)
  end
end