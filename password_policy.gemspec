# -*- encoding: utf-8 -*-
require File.expand_path('../lib/password_policy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Craig Russell"]
  gem.email         = ["craig@craig-russell.co.uk"]
  gem.description   = %q{A simple password policy enforcer}
  gem.summary       = %q{Password Policy}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "password_policy"
  gem.require_paths = ["lib"]
  gem.version       = PasswordPolicy::VERSION
end
