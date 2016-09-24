# frozen_string_literal: true

require "vcr_helper"

RSpec.describe Postcodesio::Locate do
  subject(:locate) { described_class.call(lat: latitude, lon: longitude) }

  let(:latitude) { "53.341446" }
  let(:longitude) { "-2.21541" }

  it "returns collection" do
    VCR.use_cassette("valid/locate") do
      expect(locate.size).to eq(5)
    end
  end

  it "returns collection of result objects" do
    VCR.use_cassette("valid/locate") do
      expect(locate.first).to be_an_instance_of(Postcodesio::Result)
    end
  end

  context "when there are no results" do
    let(:longitude) { "5" }

    it "return null result object" do
      VCR.use_cassette("invalid/locate") do
        expect(locate).to eq([])
      end
    end
  end
end
