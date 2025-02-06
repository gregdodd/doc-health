# frozen_string_literal: true

require "test_helper"

class TestDocHealth < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::DocHealth::VERSION
  end

  def test_cli_options
    options = DocHealth::CLI.options
    assert_instance_of Hash, options
  end

  def test_git_file_commit_author
    git = DocHealth::Git.new(Dir.pwd)
    rows = git.file_commit_author
    assert_instance_of Array, rows
  end
end
