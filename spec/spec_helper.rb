# frozen_string_literal: true

require "simplecov"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "postcodesio"

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random

  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.before do
    Postcodesio.configuration.verbose = false
  end

  config.after do
    Postcodesio.configuration.verbose = false
  end
end
