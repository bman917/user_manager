$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "user_manager/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "user_manager"
  s.version     = UserManager::VERSION
  s.authors     = ["jchan"]
  s.email       = ["bman917@gmail.com"]
  s.homepage    = "http://bman917.com"
  s.summary     = "UserManager"
  s.description = "Complete User Manager App using devise as the main engine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1"
  s.add_dependency "devise", "~> 3.4"
  s.add_dependency 'foundation-rails', "~> 5.5"
  s.add_dependency 'sass-rails'
  
  s.add_development_dependency "sqlite3", "~> 1.3"
  s.add_development_dependency "better_errors", "~> 1.1"
  s.add_development_dependency "meta_request", "~>0.3"
  s.add_development_dependency "binding_of_caller", "~>0.7"
end