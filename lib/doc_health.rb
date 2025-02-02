# frozen_string_literal: true

require_relative "doc_health/version"
require_relative "doc_health/cli"
require_relative "doc_health/report"

module DocHealth
  class Error < StandardError; end

  def self.health_report
    options = DocHealth::CLI.options
    Report.new(options).generate
  end
end
