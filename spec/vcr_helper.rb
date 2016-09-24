# frozen_string_literal: true

require "spec_helper"

require "vcr"
require "webmock/rspec"

VCR.configure do |c|
  c.cassette_library_dir = "spec/fixtures/cassettes"
  c.hook_into :webmock
end
