# frozen_string_literal: true

require "spec_helper"

RSpec.describe Postcodesio::NullResult do
  let(:instance) { described_class.new }

  describe "#value?" do
    subject(:valid) { instance.valid? }

    it "returns false" do
      expect(valid).to eq(false)
    end
  end

  describe "#as_hash" do
    subject(:as_hash) { instance.as_hash }

    it "returns response" do
      expect(as_hash).to eq({})
    end
  end
end
