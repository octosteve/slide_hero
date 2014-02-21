# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slide_hero/version'

Gem::Specification.new do |spec|
  spec.name          = "slide_hero"
  spec.version       = SlideHero::VERSION
  spec.authors       = ["Steven Nunez"]
  spec.email         = ["steven.nunez@gmail.com"]
  spec.description   = %q{Used for creating slide decks backed by reveal.js}
  spec.summary       = %q{Used for creating slide decks backed by reveal.js}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "tilt", "~> 1.4"
  spec.add_dependency "thor", "~> 0.18"
  spec.add_dependency "rack", "~> 1.5"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "minitest", "~> 5.2"
  spec.add_development_dependency "guard", "~> 2.4"
  spec.add_development_dependency "guard-minitest", "~> 2.2"
end
