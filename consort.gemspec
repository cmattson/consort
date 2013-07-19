# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'consort/version'

Gem::Specification.new do |spec|
  spec.name          = "consort"
  spec.version       = Consort::VERSION
  spec.authors       = ["Colin Mattson"]
  spec.email         = ["colinm@pixelcloud.us"]
  spec.description   = %q{Consort allows you to define relationships between various ORM/ODMs and access them similarly to ActiveRecord associations.}
  spec.summary       = %q{Ease integration between ActiveRecord and NoSQL solutions.}
  spec.homepage      = "https://github.com/cmattson/consort"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",      "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "activerecord", "~> 3.2"
  spec.add_development_dependency "activesupport","~> 3.2"
  spec.add_development_dependency "mongoid",      "~> 3.1"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "combustion"

  spec.add_runtime_dependency "activesupport",  "~> 3.2"
  spec.add_runtime_dependency "activerecord",   "~> 3.2"
  spec.add_runtime_dependency "mongoid",        "~> 3.1"
end
