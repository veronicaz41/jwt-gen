# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jwtcli/version'

Gem::Specification.new do |spec|
  spec.name          = "jwtcli"
  spec.version       = Jwtcli::VERSION
  spec.authors       = ["Veronica Zheng"]
  spec.email         = ["zhengzhixing@gmail.com"]

  spec.summary       = %q{CLI for generating Json Web Tokens (JWT's)}
  spec.description   = %q{The CLI takes multiple key value pairs as input, and copy the generated JWT to your clipboard. Required inputs are user_id and email.}
  spec.homepage      = "https://github.com/veronicaz41/jwtcli"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_dependency "tty-prompt"
  spec.add_dependency "jwt"
  spec.add_dependency "clipboard"
end
