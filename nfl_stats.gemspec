# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nfl_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "nfl_stats"
  spec.version       = NflStats::VERSION
  spec.authors       = ["John Maddux"]
  spec.email         = ["jemaddux@gmail.com"]
  spec.summary       = %q{NFL statistics}
  spec.description   = %q{NFL statistics from the GameDay API}
  spec.homepage      = ""
  spec.license       = "None, private for now."

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
