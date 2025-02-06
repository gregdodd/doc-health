# DocHealth

DocHealth is a Ruby gem that scans a given path for Markdown (`.md`) files and retrieves the last updated date and author. It provides a terminal readout or exports the results to a CSV file, helping you monitor the health of your documentation.

## Installation

Install the gem and add it to your application's Gemfile by executing:

```bash
bundle add doc_health
```

If bundler is not being used to manage dependencies, install the gem manually:

```bash
gem install doc_health
```

## Usage

To scan a directory for Markdown files and display the last modified date and author, run:

```bash
doc-health --path /path/to/docs
```

To output the results to a CSV file:

```bash
doc-health --path /path/to/docs --csv
```

## Development

After cloning the repository, install dependencies:

```bash
bin/setup
```

Run the tests:

```bash
rake test
```

Use `bin/console` for an interactive prompt to experiment with the code.

To install this gem locally:

```bash
bundle exec rake install
```

To release a new version:
1. Update the version number in `lib/doc_health/version.rb`.
2. Run:

```bash
bundle exec rake release
```

This will create a git tag, push commits and the tag, and publish the gem to [RubyGems](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/YOUR_USERNAME/doc_health](https://github.com/YOUR_USERNAME/doc_health).

