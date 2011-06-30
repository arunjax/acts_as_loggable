# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_loggable/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_loggable"
  s.version     = ActsAsLoggable::VERSION
  s.authors     = ["Arun Kumar Arjunan"]
  s.email       = ["arun.immanuel1608@gmail"]
  s.homepage    = ""
  s.summary     = %q{Create and display activity feeds easily}
  s.description = %q{Create and display activity feeds easily}

  s.rubyforge_project = "acts_as_loggable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
