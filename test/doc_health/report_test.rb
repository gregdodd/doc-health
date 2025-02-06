# frozen_string_literal: true

module DocHealth
  class ReportTest < Minitest::Test
    def test_report
      options = DocHealth::CLI.options
      report = DocHealth::Report.new(options)
      assert_instance_of DocHealth::Report, report
    end
  end
end
