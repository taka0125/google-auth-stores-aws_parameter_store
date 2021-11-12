Gem::Specification.new do |spec|
  spec.name          = "google-auth-stores-aws_parameter_store"
  spec.version       = "0.1.0"
  spec.authors       = ["Takahiro Ooishi"]
  spec.email         = ["taka0125@gmail.com"]

  spec.summary       = %q{Google Auth Store use AWS Parameter Store}
  spec.description   = %q{Google Auth Store use AWS Parameter Store}
  spec.homepage      = "https://github.com/taka0125/google-auth-stores-aws_parameter_store"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'googleauth'
  spec.add_dependency 'aws-sdk-ssm'
end
