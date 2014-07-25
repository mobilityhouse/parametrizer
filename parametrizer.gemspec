# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parametrizer/version'

Gem::Specification.new do |spec|
  spec.name          = "parametrizer"
  spec.version       = Parametrizer::VERSION
  spec.authors       = ["Adrian Serafin"]
  spec.email         = ["adrian.serafin@elpassion.pl"]
  spec.summary       = %q{Extracts language and oem to params}
  spec.description   = %q{Extracts language and oem to params}
  spec.homepage      = "https://github.com/mobilityhouse/parametrizer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "actionpack", "~> 4.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"
end
