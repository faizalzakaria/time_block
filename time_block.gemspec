# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'time_block/version'

Gem::Specification.new do |spec|
  spec.name          = 'time_block'
  spec.version       = TimeBlock::VERSION
  spec.authors       = ['Faizal Zakaria']
  spec.email         = ['phaibusiness@gmail.com']
  spec.summary       = 'Time block'
  spec.description   = 'Notifier to notify you when your time block is ended'
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.executables   = 'timeblock'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency 'terminal-notifier'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_dependency 'dante'
end
