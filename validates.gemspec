# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates/version"

Gem::Specification.new do |s|
  s.name        = "validates"
  s.version     = Validates::VERSION
  s.authors     = ["Mikhail Stolbov"]
  s.email       = ["mstolbov@gmail.com"]
  s.homepage    = "https://github.com/kaize/validates"
  s.summary     = "Collection of simple validators for Rails 3"
  s.description = "Email, Slug, Url validators for Rails 3"

  s.rubyforge_project = "validates"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "activemodel", [">= 3.0.0"]
end
