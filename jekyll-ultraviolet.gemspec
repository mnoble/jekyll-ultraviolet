# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jekyll/ultraviolet/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matte Noble"]
  gem.email         = ["me@mattenoble.com"]
  gem.description   = %q{Ultraviolet syntax highlighting in Jekyll}
  gem.summary       = %q{Ultraviolet syntax highlighting in Jekyll}

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "jekyll-ultraviolet"
  gem.require_paths = ["lib"]
  gem.version       = Jekyll::Ultraviolet::VERSION
end
