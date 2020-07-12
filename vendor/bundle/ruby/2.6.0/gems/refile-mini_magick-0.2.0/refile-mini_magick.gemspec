# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'refile/mini_magick/version'

Gem::Specification.new do |spec|
  spec.name          = "refile-mini_magick"
  spec.version       = Refile::MiniMagick::VERSION
  spec.authors       = ["Jonas Nicklas"]
  spec.email         = ["jonas.nicklas@gmail.com"]
  spec.summary       = "Image processing via MiniMagick for Refile"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "refile", "~> 0.5"
  spec.add_dependency "mini_magick", "~> 4.0"
end
