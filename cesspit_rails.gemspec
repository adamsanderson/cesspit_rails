$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cesspit_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cesspit_rails"
  s.version     = CesspitRails::VERSION
  s.authors     = ["Adam Sanderson"]
  s.email       = ["netghost@gmail.com"]
  s.homepage    = "https://github.com/adamsanderson/cesspit_rails"
  s.summary     = "Helpers to make using CessPit easier with Rails."
  s.description = "Finds unused css declarations in Rails apps."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails",   "~> 4.2.0"
  s.add_dependency "cesspit", "~> 0.1.0"
  
  s.add_development_dependency "sass-rails", "~> 5.0.1"
  s.add_development_dependency "pry"
end
