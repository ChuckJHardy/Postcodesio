# frozen_string_literal: true

require "spec_helper"

def response # rubocop:disable Metrics/MethodLength
  {
    postcode: "EX17 4AZ",
    quality: 1,
    eastings: 287,
    northings: 104,
    country: "England",
    nhs_ha: "South West",
    longitude: -3.59168076007149,
    latitude: 50.8271675496744,
    parliamentary_constituency: "Central Devon",
    european_electoral_region: "South West",
    primary_care_trust: "Devon",
    region: "South West",
    lsoa: "Mid Devon 010A",
    msoa: "Mid Devon 010",
    incode: "4AZ",
    outcode: "EX17",
    distance: 1.732027679,
    admin_district: "Mid Devon",
    parish: "Stockleigh Pomeroy",
    admin_county: "Devon",
    admin_ward: "Newbrooke",
    ccg: "NHS North, East, West Devon",
    nuts: "Devon CC",
    codes: {
      admin_district: "E07000042",
      admin_county: "E10000008",
      admin_ward: "E05008547",
      parish: "E04003050",
      ccg: "E38000129",
      nuts: "UKK43"
    }
  }
end

RSpec.describe Postcodesio::Result do
  let(:instance) do
    described_class.new(response: response)
  end

  describe "#as_hash" do
    subject(:as_hash) { instance.as_hash }

    it "returns response" do
      expect(as_hash).to eq(response)
    end
  end

  response.each do |key, value|
    describe "##{key}" do
      subject(:action) { instance.public_send(key) }

      it "returns expected value" do
        expect(action).to eq(value)
      end
    end
  end
end
