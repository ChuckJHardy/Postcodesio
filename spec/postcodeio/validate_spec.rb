require "spec_helper"

RSpec.describe Postcodesio::Validate do
  subject(:validator) { [response].map(&Postcodesio::Validate).first }

  let(:response) { double("Faraday::Response", status: status, body: body) }
  let(:body) { {} }
  let(:status) { 200 }

  it "returns true when nothing is wrong" do
    expect(validator).to be_truthy
  end

  describe "When InternalServerError" do
    let(:status) { 500 }
    let(:body) { { error: true, msg: msg, code: 500 } }
    let(:msg) { "message" }

    it "raises error" do
      expect { validator }.to raise_error(
        Postcodesio::InternalServerError, msg
      )
    end
  end

  describe "When NotFound" do
    let(:status) { 404 }
    let(:body) { { error: true, code: 404 } }

    it "raises error" do
      expect { validator }.to raise_error(Postcodesio::NotFound, "")
    end
  end
end
