# frozen_string_literal: true

require "vcr_helper"

RSpec.describe Postcodesio::Locate do
  subject(:locate) { described_class.call(lat: latitude, lon: longitude) }

  let(:latitude) { "50.827152" }
  let(:longitude) { "-3.591682" }

  it "calls off to DTO and returns" do
    VCR.use_cassette("valid/locate") do
      expect(locate).to be_an_instance_of(Postcodesio::Result)
    end
  end
end
