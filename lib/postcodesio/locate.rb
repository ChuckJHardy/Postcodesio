# frozen_string_literal: true

require "postcodesio/dto"
require "postcodesio/result"

class Postcodesio
  class Locate
    def initialize(lat:, lon:)
      @lat = lat
      @lon = lon
    end

    def self.call(*args)
      new(*args).call
    end

    def call
      response.map(&Result)
    end

    private

    def response
      @response ||= dto[:result] || []
    end

    def dto
      DTO.get(
        params: {
          lat: @lat,
          lon: @lon
        }
      )
    end
  end
end
