# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'softbank_healthcare/version'

Gem::Specification.new do |spec|
  spec.name          = "softbank-healthcare-client"
  spec.version       = SoftBankHealthCare::VERSION
  spec.authors       = ["shunirr"]
  spec.email         = ["m@s5r.jp"]
  spec.summary       = %q{Softbank HealthCare Client for Ruby}
  spec.description   = %q{Softbank HealthCare Client for Ruby}
  spec.homepage      = "https://github.com/shunirr/softbank-healthcare-client-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency 'faraday'
end
