# frozen_string_literal: true

require_relative "doc_health/version"

module DocHealth
  class Error < StandardError; end

  def self.hello_world
    "Here's your doc health report!"
  end
end
