# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "carriercouch/version"

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
end
