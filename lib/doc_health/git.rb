# frozen_string_literal: true

require "git"

module DocHealth
  class Git
    attr_reader :path

    def initialize(path)
      @git = ::Git.open(path)
      @path = path
    end

    def file_and_last_commit
      Dir.glob("#{path}**/*.md").map do |file|
        est_time = last_commit_date(file)
        [file, est_time]
      end
    end

    def last_commit_date(file)
      @git.log(1).object(file).first.date.getlocal("-05:00").strftime("%Y-%m-%d %I:%M %p")
    end
  end
end
