# frozen_string_literal: true

module DocHealth
  class CLITest < Minitest::Test
    def test_options
      options = CLI.options
      assert_equal({}, options)
    end

    def test_options_with_path
      options = CLI.options
      assert_equal({}, options)

      ARGV.replace ["-p", "test"]
      options = CLI.options
      assert_equal({ path: "test" }, options)
    end

    def test_options_with_csv
      options = CLI.options
      assert_equal({}, options)

      ARGV.replace ["-csv"]
      options = CLI.options
      assert_equal({ csv: true }, options)
    end
  end
end
