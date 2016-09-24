# frozen_string_literal: true

require "postcodesio/dto"
require "postcodesio/null_result"
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
      response ? Result.new(response: response) : NullResult.new
    end

    private

    def response
      @response ||= (dto[:result] || []).first
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
