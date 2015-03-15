# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nervy/version'

Gem::Specification.new do |spec|

  spec.name          = "nervy"
  spec.version       = Nervy::VERSION
  spec.authors       = ["davidkelley"]
  spec.email         = ["david.james.kelley@gmail.com"]
  spec.summary       = %q{Nervy is a Ruby client for the Public Notification Service}
  spec.homepage      = "https://github.com/davidkelley/nervy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'faraday'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'bunny'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rubocop'

end
