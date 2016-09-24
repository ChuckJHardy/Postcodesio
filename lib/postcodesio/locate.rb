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
      Result.new(response: response)
    end

    private

    def response
      DTO.get(
        params: {
          lat: @lat,
          lon: @lon,
        }
      )
    end
  end
end
