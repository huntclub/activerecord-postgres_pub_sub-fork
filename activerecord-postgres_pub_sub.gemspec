# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activerecord/postgres_pub_sub/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-postgres_pub_sub"
  spec.version       = ActiveRecord::PostgresPubSub::VERSION
  spec.authors       = ["ezCater, Inc"]
  spec.email         = ["engineering@ezcater.com"]
  spec.summary       = "Support for Postgres Notify/Listen"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/huntclub/activerecord-postgres_pub_sub-fork"
  spec.license       = "MIT"
  spec.metadata["github_repo"] = "ssh://github.com/huntclub/activerecord-postgres_pub_sub-fork"
  spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/huntclub"

  excluded_files = %w(.circleci/config.yml
                      .github/PULL_REQUEST_TEMPLATE.md
                      .gitignore
                      .rspec
                      .rubocop.yml
                      .ruby-gemset
                      .ruby-version
                      .travis.yml
                      bin/console
                      bin/setup
                      Rakefile)

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features)\//)
  end - excluded_files
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.7.0"

  spec.add_runtime_dependency "activerecord", "> 5.1", "< 7.2"
  spec.add_runtime_dependency "pg", "~> 1.1"
  spec.add_runtime_dependency "private_attr"
  spec.add_runtime_dependency "with_advisory_lock"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "bundler", ">= 1.3.0"
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "ezcater_matchers"
  spec.add_development_dependency "ezcater_rubocop", "~> 3.0"
  spec.add_development_dependency "overcommit"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "rspec_junit_formatter", "0.2.2"
  spec.add_development_dependency "simplecov"
end
