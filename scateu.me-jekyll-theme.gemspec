# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "scateu.me-jekyll-theme"
  spec.version       = "0.2.1"
  spec.authors       = ["Anjue"]
  spec.email         = ["anjue39@gmail.com"]

  spec.summary       = %q{jekyll theme of scateu.me}
  spec.homepage      = "http://anjue39.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|feed.xml|index.html|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.3"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
