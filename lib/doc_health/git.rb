# frozen_string_literal: true

require "git"

module DocHealth
  class Git
    attr_reader :path

    def initialize(path)
      @git = ::Git.open(path)
      @path = path
    end

    def file_commit_author
      Dir.glob("#{path}**/*.md").map do |file|
        est_time = last_commit_date(file)
        author = last_commit_author(file)
        [file, est_time, author]
      end
    end

    def last_commit_date(file)
      gitlog = @git.log(1).object(file).first
      return "N/A" unless gitlog

      gitlog.date.getlocal("-05:00").strftime("%Y-%m-%d %I:%M %p")
    end

    def last_commit_author(file)
      gitlog = @git.log(1).object(file).first
      return "N/A" unless gitlog

      @git.log(1).object(file).first.author.name
    end
  end
end
