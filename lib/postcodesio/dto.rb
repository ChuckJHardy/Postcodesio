# frozen_string_literal: true

require "postcodesio/api"
require "postcodesio/validate"

class Postcodesio
  class DTO
    attr_reader :options

    def initialize(options:)
      @options = options
    end

    def self.get(options = {})
      new(options: options).response(:get)
    end

    def self.post(options = {})
      new(options: options).response(:post)
    end

    def response(method)
      API.public_send(
        method,
        domain: domain,
        url: "/postcodes",
        options: {
          format: "json"
        }.merge(params)
      ).tap(&Postcodesio::Validate).body
    end

    def params
      options.fetch(:params, {})
    end

    private

    def domain
      Postcodesio.configuration.base_url
    end
  end
end
