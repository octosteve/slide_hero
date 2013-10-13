# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slide_hero/version'

Gem::Specification.new do |spec|
  spec.name          = "slide_hero"
  spec.version       = SlideHero::VERSION
  spec.authors       = ["Steven Nunez"]
  spec.email         = ["snunez@cyrusinnovation.com"]
  spec.description   = %q{Used for creating slide decks backed by reveal.js}
  spec.summary       = %q{Used for creating slide decks backed by reveal.js}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
end
