# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "carriercouch"
  s.version     = Carriercouch::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Shenouda Bertel"]
  s.email       = ["sbertel@arpuplus.com"]
  s.homepage    = ""
  s.summary     = %q{Carrierwave Uploader for CouchDB with CouchrestModel}
  s.description = %q{Carrierwave Uploader for CouchDB with CouchrestModel}

  s.rubyforge_project = "carriercouch"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rails", ["~> 3.0.5"]
  s.add_development_dependency "rspec"
  s.add_development_dependency "mini_magick", ["~> 2.3"]
  s.add_development_dependency "carrierwave"
  s.add_development_dependency "activemodel"
  s.add_development_dependency "couchrest_model"
end
