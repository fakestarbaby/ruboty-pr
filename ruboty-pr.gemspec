lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/pr/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-pr"
  spec.version       = Ruboty::PR::VERSION
  spec.authors       = ["Yoshinori Hirasawa"]
  spec.email         = ["fakestarbaby@gmail.com"]
  spec.summary       = "Output pull requests as markdown via Ruboty."
  spec.homepage      = "https://github.com/fakestarbaby/ruboty-pr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "ruboty"
  spec.add_dependency "octokit"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
