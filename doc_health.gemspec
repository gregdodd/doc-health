# frozen_string_literal: true

require_relative "lib/doc_health/version"

Gem::Specification.new do |spec|
  spec.name = "doc_health"
  spec.version = DocHealth::VERSION
  spec.authors = ["Greg Dodd"]
  spec.email = ["greg.dodd@shopify.com"]

  spec.summary = "Returns a report on the health of your markdown documentation."
  spec.description = "Returns a report on the health of your markdown documentation. The generated report is a CSV."
  spec.homepage = "https://github.com/gregdodd/doc-health.git"
  spec.required_ruby_version = ">= 3.1.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gregdodd/doc-health.git"
  spec.metadata["changelog_uri"] = "https://github.com/gregdodd/doc-health/blob/main/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = ["doc-health"]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "git", "~> 2.3"
  spec.add_dependency "terminal-table", "~> 4.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
