# frozen_string_literal: true

class Postcodesio
  module Configure
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
      configuration
    end

    class Configuration
      attr_accessor :base_url,
                    :timeout,
                    :verbose,
                    :logger

      def initialize
        self.base_url = base_url_default
        self.timeout = timeout_default

        self.verbose = ENV["POSTCODESIO_VERBOSE"] || false

        self.logger = Logger.new(STDOUT)
      end

      private

      def base_url_default
        ENV["POSTCODESIO_BASE_URL"] || "https://api.postcodes.io/"
      end

      def timeout_default
        ENV["POSTCODESIO_TIMEOUT"] || 3600
      end
    end
  end
end
