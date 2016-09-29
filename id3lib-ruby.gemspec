Gem::Specification.new do |spec|
  spec.name          = "id3lib-ruby"
  spec.version       = "0.6.0"
  spec.summary	     = "id3lib-ruby"
  spec.authors       = ["Hamed Hashemi"]
  spec.email         = ["hamedh@gmail.com"]

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
