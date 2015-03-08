$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "orthodoxy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "orthodoxy"
  s.version     = Orthodoxy::VERSION
  s.authors     = ["Chris Fung"]
  s.email       = ["aergonaut@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Orthodoxy."
  s.description = "TODO: Description of Orthodoxy."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 3.2.1"
  s.add_development_dependency "factory_girl_rails", "~> 4.5.0"
  s.add_development_dependency "shoulda-matchers", "~> 2.8.0"
  s.add_development_dependency "pry"
end
