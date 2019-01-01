# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest/sub_test_case/version'

Gem::Specification.new do |spec|
  spec.name          = "minitest-sub_test_case"
  spec.version       = Minitest::SubTestCase::VERSION
  spec.authors       = ["Yuji Yaginuma"]
  spec.email         = ["yuuji.yaginuma@gmail.com"]

  spec.summary       = %q{minitest-sub_test_case makes sub_test_case available in minitest/test.}
  spec.homepage      = "https://github.com/y-yagi/minitest-sub_test_case"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
