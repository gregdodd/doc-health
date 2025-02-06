# frozen_string_literal: true

module DocHealth
  class GitTest < Minitest::Test
    def test_git_file_commit_author
      git = DocHealth::Git.new(Dir.pwd)
      rows = git.file_commit_author
      assert_instance_of Array, rows
    end
  end
end
