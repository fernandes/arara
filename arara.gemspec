$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "arara/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "arara"
  spec.version     = Arara::VERSION
  spec.authors     = ["Celso Fernandes"]
  spec.email       = ["celso.fernandes@gmail.com"]
  spec.homepage    = "https://github.com/fernandes/arara"
  spec.summary     = "A material design theme for Ruby on Rails"
  spec.description = "Material Design based theme for Ruby on Rails, using stimulus for JS and ActionView Components for its components" 
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6"
  spec.add_dependency "actionview-component", "~> 1"

  spec.add_development_dependency "sqlite3"
end
