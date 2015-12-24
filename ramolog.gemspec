# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ramolog/version'

Gem::Specification.new do |spec|
  spec.name          = "ramolog"
  spec.version       = Ramolog::VERSION
  spec.authors       = ["Takashi Toyoshima"]
  spec.email         = ["toyoshim@gmail.com"]
  spec.summary       = "MongoDB backed Rack's CommonLogger replacement."
  spec.description   = <<-EOD
Momolog is a simple CommonLogger replacement for Rack.
This module allows you to use MongoDB to store access logs.
EOD
  spec.homepage      = "https://github.com/toyoshim/ramolog"
  spec.license       = "BSD"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "mongo", "~> 2.1"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
