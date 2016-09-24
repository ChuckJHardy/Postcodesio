require "spec_helper"

RSpec.describe Postcodesio::DTO do
  let(:instance) { described_class.new(options: options) }
  let(:options) { { params: params } }
  let(:params) { { lat: 1, lon: 2 } }

  let(:response) { double("Faraday::Response", status: 200, body: {}) }

  let(:domain) { "https://example.com" }
  let(:endpoint) { "/postcodes" }

  before do
    allow_any_instance_of(described_class).to receive(:domain) { domain }
  end

  describe ".get" do
    subject { described_class.get(options) }

    it "calls off to API and returns response body" do
      expect(Postcodesio::API).to receive(:get).with(
        domain: domain,
        url: endpoint,
        options: {
          format: "json",
          lat: 1,
          lon: 2
        }
      ) { response }

      expect(subject).to eq({})
    end
  end

  describe ".post" do
    subject { described_class.post(options) }

    it "calls off to API and returns response body" do
      expect(Postcodesio::API).to receive(:post).with(
        domain: domain,
        url: endpoint,
        options: {
          format: "json",
          lat: 1,
          lon: 2
        }
      ) { response }

      expect(subject).to eq({})
    end
  end

  describe "#params" do
    it "returns empty hash" do
      expect(instance.params).to eq(params)
    end
  end
end
