# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_block/version'

Gem::Specification.new do |spec|
  spec.name          = "time_block"
  spec.version       = TimeBlock::VERSION
  spec.authors       = ["Faizal Zakaria"]
  spec.email         = ["phaibusiness@gmail.com"]
  spec.summary       = %q{Time block}
  spec.description   = %q{Notifier to notify you when your time block is ended}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.executables   = "timeblock"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "terminal-notifier"
end
