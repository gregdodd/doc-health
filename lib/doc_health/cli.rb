# frozen_string_literal: true

require "optparse"

module DocHealth
  class CLI
    def self.options
      options = {}

      OptionParser.new do |opts|
        opts.banner = "Usage: doc-health [options]"

        opts.on("-h", "--help", "Show this help message") do
          exit
        end

        opts.on("-p PATH", "--path=PATH", "Specify the documentation path") do |path|
          options[:path] = path
        end

        opts.on("-csv", "--csv", "Generate CSV report") do
          options[:csv] = true
        end
      end.parse!

      options
    end
  end
end
