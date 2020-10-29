require_relative "lib/inspec-reporter-tap/version"

Gem::Specification.new do |spec|
  spec.name          = "inspec-reporter-tap"
  spec.version       = InspecPlugins::TapReporter::VERSION
  spec.authors       = ["Thomas Heinen"]
  spec.email         = ["theinen@tecracer.de"]
  spec.summary       = "InSpec Reporter for the Test Anything Protocol (TAP)"
  spec.description   = "Plugin following TAP/TAP13"
  spec.homepage      = "https://github.com/tecracer-chef/inspec-reporter-tap"
  spec.license       = "Apache-2.0"

  spec.files         = Dir["lib/**/**/**"]
  spec.files        += Dir["templates/**/**/**"]
  spec.files        += ["README.md", "CHANGELOG.md"]

  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.6"

  # spec.add_dependency "inspec", ">= 4.18.117"

  spec.add_development_dependency "bump", "~> 0.9"
  spec.add_development_dependency "chefstyle", "~> 0.14"
  spec.add_development_dependency "guard", "~> 2.16"
  spec.add_development_dependency "mdl", "~> 0.9"
  spec.add_development_dependency "rake", "~> 13.0"
end
