# frozen_string_literal: true

require "vcr_helper"

RSpec.describe Postcodesio do
  describe ".locate" do
    subject(:locate) { described_class.locate(lat: latitude, lon: longitude) }

    let(:latitude) { "53.341446" }
    let(:longitude) { "-2.21541" }

    it "returns collection of result objects" do
      VCR.use_cassette("valid/locate") do
        expect(locate.first).to be_an_instance_of(Postcodesio::Result)
      end
    end
  end
end
