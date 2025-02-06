# frozen_string_literal: true

require "terminal-table"
require "csv"
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

      rows = Git.new(path).file_commit_author

      if @generate_csv
        generate_csv(rows)
        puts "📋 CSV generated"
        return
      end

      print_table(["File", "Last Commit (EST)"], rows)
    end

    def print_table(headers, rows)
      table = Terminal::Table.new headings: headers, rows: rows
      puts table
    end

    def generate_csv(rows)
      CSV.open("doc_health_report.csv", "wb") do |csv|
        csv << ["File", "Last Commit (EST)"]
        rows.each { |row| csv << row }
      end
    end
  end
end
