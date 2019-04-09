# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "metacrunch/file/version"

Gem::Specification.new do |spec|
  spec.name          = "metacrunch-file"
  spec.version       = Metacrunch::File::VERSION
  spec.authors       = ["René Sprotte"]
  spec.summary       = %q{File package for the metacrunch ETL toolkit.}
  spec.homepage      = "http://github.com/ubpb/metacrunch-file"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 5.1.0"
  spec.add_dependency "axlsx", ">= 3.0.0.pre"
end
