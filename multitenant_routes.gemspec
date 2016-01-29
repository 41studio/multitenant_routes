$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "multitenant_routes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "multitenant_routes"
  s.version     = MultitenantRoutes::VERSION
  s.authors     = ["Agung Yuliaji"]
  s.email       = ["agung.yuliaji@gmail.com"]
  s.homepage    = "https://agung.work"
  s.summary     = "Multitenant Routes"
  s.description = "Multitenant Routes engine for Multitenant Rails Application"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
