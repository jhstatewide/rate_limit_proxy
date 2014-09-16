# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/rate_limit_proxy'

Gem::Specification.new do |spec|
  spec.name          = 'rate_limit_proxy'
  spec.version       = RateLimitProxy::VERSION
  spec.authors       = ['Joshua Harding']
  spec.email         = ['josh@statewidesoftware.com']
  spec.summary       = 'Wraps any object with a rate limiter.'
  spec.description   = 'Wraps any object with a rate limiter.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency 'glutton_ratelimit'

  spec.add_development_dependency 'bundler', "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
