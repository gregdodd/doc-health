# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"

Minitest::TestTask.create

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[test rubocop]

task :build_and_install do
  system "gem build doc_health.gemspec"
  system "gem install doc_health-0.1.0.gem"
end
