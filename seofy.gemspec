# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "seofy/version"

Gem::Specification.new do |s|
  s.name        = "seofy"
  s.version     = Seofy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Allen Wei"]
  s.email       = ["digruby@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A flexiable permalink plugin for Rails}
  s.description = %q{https://github.com/allenwei/seofy}

  s.rubyforge_project = "seofy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "babosa", "~> 0.3.0"
  s.add_dependency "activerecord", "> 3.0.0"
  s.add_dependency "activesupport", "> 3.0.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec", "> 2.5.0"
  s.add_development_dependency "guard"
  s.add_development_dependency "growl"
end
