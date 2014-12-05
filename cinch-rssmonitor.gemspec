# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cinch/rssmonitor/version'

Gem::Specification.new do |spec|
  spec.name          = "cinch-rssmonitor"
  spec.version       = Cinch::Rssmonitor::VERSION
  spec.authors       = ["Renato dos Santos"]
  spec.email         = ["shazaum@me.com"]
  spec.summary       = %q{RSS Monitor}
  spec.description   = %q{A simple rss monitor}
  spec.homepage      = "https://github.com/shazaum/cinch-rssmonitor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "simple", "~> 1.3.1"
  spec.add_development_dependency "open-uri", "~> 0"
  spec.add_development_dependency "yaml", "~> 0"
  
end
