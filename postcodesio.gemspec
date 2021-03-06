# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "postcodesio/version"

Gem::Specification.new do |spec|
  spec.name          = "postcodesio"
  spec.version       = Postcodesio::VERSION
  spec.authors       = ["Charles J Hardy"]
  spec.email         = ["chuckjhardy@gmail.com"]

  spec.summary       = "Wrapper for Postcode.io API"
  spec.description   = "Wrapper for Postcode.io API"
  spec.homepage      = "https://github.com/chuckjhardy/Postcodesio"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.9"
  spec.add_runtime_dependency "faraday_middleware", "~> 0.10"
  spec.add_runtime_dependency "faraday-conductivity", "~> 0.3"
  spec.add_runtime_dependency "faraday_middleware-multi_json", "~> 0.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
