# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/version'

Gem::Specification.new do |gem|
  gem.name        = 'ubuntu-rails-server'
  gem.version     = UbuntuRailsServer::Version.to_s
  gem.summary     = "Capistrano recipies for installing a Rails application server on Ubuntu"
  gem.description = "Capistrano recipies for installing a Rails application server on Ubuntu. Stack includes nginx, unicorn, postgres and ruby1.9.3"
  gem.authors     = ["Jean le Roux", "Greg Sauderson", "Rowan Smith"]
  gem.email       = 'jean@shuntyard.co.za'
  gem.homepage    = 'https://github.com/Shuntyard/ubuntu-rails-server.git'
  gem.files       = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

