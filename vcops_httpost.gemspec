# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vcops_httpost/version'


Gem::Specification.new do |spec|
  spec.name          = "vcops_httpost"
  spec.version       = VcopsHttpost::VERSION
  spec.authors       = ["Clinton Kitson"]
  spec.email         = ["clinton.kitson@emc.com"]
  spec.summary       = %q{vcops_httpost allows interfacing with VMware vCenter Operations to send and receive data.}
  spec.description   = %q{This gem currently allows POST calls to the interface to add external metric information about resources.}
  spec.homepage      = "https://github.com/clintonskitson/rb_vcops_httpost/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
