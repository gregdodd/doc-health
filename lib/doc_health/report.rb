# frozen_string_literal: true

require "terminal-table"
require_relative "git"

module DocHealth
  class Report
    attr_reader :path

    def initialize(options)
      @path = options[:path] || Dir.pwd
      @generate_csv = options[:csv] || false
    end

    def generate
      unless File.directory?(path)
        puts "The path is invalid."
        return
      end

      print_table(["File", "Last Commit (EST)"], Git.new(path).file_and_last_commit)
    end

    def print_table(headers, rows)
      table = Terminal::Table.new headings: headers, rows: rows
      puts table
    end
  end
end
