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
end
