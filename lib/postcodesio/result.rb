# frozen_string_literal: true

class Postcodesio
  class Result
    attr_reader :response

    def initialize(response:)
      @response = response

      build
    end

    def build
      response.each(&define_method_for_header)
    end

    alias as_hash response

    private

    def define_method_for_header
      ->(key, value) { self.class.send(:define_method, key) { value } }
    end
  end
end
