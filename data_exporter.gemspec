# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_exporter/version'

Gem::Specification.new do |spec|
  spec.name          = "data_exporter"
  spec.version       = DataExporter::VERSION
  spec.authors       = ["SaveThePlan"]
  spec.email         = ["realnanook@gmail.com"]
  # spec.summary       = %q{TODO: Write a short summary. Required.}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.summary       = %q{gem test: Data exporter.}
  spec.description   = %q{Data exporter provide DataCollector and DataFormatter classes. You must subclass them for use.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
