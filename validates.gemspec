# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates/version"

Gem::Specification.new do |s|
  s.name        = "validates"
  s.version     = Validates::VERSION
  s.authors     = ["Mikhail Stolbov","Anton Taraev","Konstantin Kosmatov","Andrey Subbota"]
  s.email       = ["mstolbov@gmail.com","anti191@gmail.com","key@kosmatov.su","subbota@gmail.com"]
  s.homepage    = "http://github.com/kaize/validates"
  s.summary     = %q{Collection of useful custom validators for Rails applications}
  s.description = %q{validates provides a set of commonly required validators (such as Email, Url, etc.) for Rails applications}

  s.rubyforge_project = "validates"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  s.require_paths = ["lib"]

  s.rdoc_options      = %w(--line-numbers --inline-source --title validates --main README.md)
  s.extra_rdoc_files  = %w(README.md LICENSE CONTRIBUTING.md)

  s.add_dependency "activemodel", [">= 3.0.0"]
  s.add_dependency "activesupport", [">= 3.0.0"]
end
