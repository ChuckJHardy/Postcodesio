require "vcr_helper"

RSpec.describe Postcodesio do
  describe ".locate" do
    subject(:locate) { described_class.locate(lat: latitude, lon: longitude) }

    let(:latitude) { "50.827152" }
    let(:longitude) { "-3.591682" }

    it "returns result object" do
      VCR.use_cassette("valid/locate") do
        expect(locate).to be_an_instance_of(Postcodesio::Result)
      end
    end
  end
end
