# frozen_string_literal: true

class Postcodesio
  class Validate
    def initialize(response:)
      @response = response
    end

    def self.to_proc
      ->(response) { with(response) }
    end

    def self.with(response)
      new(response: response).validate
    end

    def validate
      raise Postcodesio::InternalServerError, message if internal_error?
      raise Postcodesio::NotFound, message if not_found?

      true
    end

    private

    attr_reader :response

    def internal_error?
      response.status == 500
    end

    def not_found?
      response.status == 404
    end

    def message
      response.body.fetch(:msg, "")
    end
  end
end
