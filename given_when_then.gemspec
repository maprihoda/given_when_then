# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "given_when_then/version"

Gem::Specification.new do |s|
  s.name        = "given_when_then"
  s.version     = GivenWhenThen::VERSION
  s.authors     = ["Marek Prihoda"]
  s.email       = ["marek.prihoda@gmail.com"]
  s.homepage    = "https://github.com/maprihoda/given_when_then"
  s.summary     = %q{Use selected Cucumber-like syntax in your Rspec tests}
  s.description = %q{Use selected Cucumber-like syntax in your Rspec tests}

  s.rubyforge_project = "given_when_then"

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rspec-core"
end

