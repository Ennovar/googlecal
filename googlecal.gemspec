# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'googlecal/version'

Gem::Specification.new do |spec|
  spec.name          = "googlecal"
  spec.version       = Googlecal::VERSION
  spec.authors       = ["Austin M Crane"]
  spec.email         = ["austin.crane@ennovar.wichita.edu"]

  spec.summary       = %q{Simple wrapper around google calendar api}
  spec.description   = %q{Simple wrapper around google calendar api}
  spec.homepage      = "http://github.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "google-api-client"

  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
