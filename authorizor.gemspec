$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "authorizor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "authorizor"
  s.version     = Authorizor::VERSION
  s.authors     = ["vlad-shevtsov-main"]
  s.email       = ["vlad.shevtsov.main@gmail.com"]
  s.homepage    = "https://github.com/vlad-shevtsov-main"
  s.summary     = "Page-specific authorization"
  s.description = "Gem provides page specific authorization for your rails app."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.beta3", "< 5.1"

  s.add_development_dependency "postgresql"
end
