require "spec_helper"

RSpec.describe Postcodesio::Configure do
  let(:instance) { Class.new { extend Postcodesio::Configure } }

  describe "#base_url" do
    subject { instance.configuration.base_url }

    let(:new_url) { "https://api.postcodes.io/" }
    let(:env_var_url) { "https://api.postcodes.io/v1/" }

    it "returns default" do
      expect(subject).to eq("https://api.postcodes.io/")
    end

    it "returns altered" do
      instance.configure { |config| config.base_url = new_url }
      expect(subject).to eq(new_url)
    end

    it "returns from ENV Var" do
      stub_const("ENV", "POSTCODESIO_BASE_URL" => env_var_url)
      expect(subject).to eq(env_var_url)
    end
  end

  describe "#timeout" do
    subject { instance.configuration.timeout }

    let(:new_timeout) { 600_00 }
    let(:env_var_timeout) { 100 }

    it "returns default" do
      expect(subject).to eq(3600)
    end

    it "returns altered" do
      instance.configure { |config| config.timeout = new_timeout }
      expect(subject).to eq(new_timeout)
    end

    it "returns from ENV Var" do
      stub_const("ENV", "POSTCODESIO_TIMEOUT" => env_var_timeout)
      expect(subject).to eq(env_var_timeout)
    end
  end

  describe "#verbose" do
    subject { instance.configuration.verbose }

    it "returns default" do
      expect(subject).to eq(false)
    end

    it "returns altered" do
      instance.configure { |config| config.verbose = true }
      expect(subject).to eq(true)
    end

    it "returns from ENV Var" do
      stub_const("ENV", "POSTCODESIO_VERBOSE" => true)
      expect(subject).to eq(true)
    end
  end

  describe "#logger" do
    subject { instance.configuration.logger }

    it "returns default" do
      expect(subject).to be_an_instance_of(Logger)
    end

    it "returns altered" do
      instance.configure { |config| config.logger = nil }
      expect(subject).to be_nil
    end
  end
end
