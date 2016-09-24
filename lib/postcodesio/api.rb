require "digest"
require "faraday"
require "faraday_middleware"
require "faraday/conductivity"
require "faraday_middleware/multi_json"

class Postcodesio
  class API
    def self.get(*args)
      new.get(*args)
    end

    def self.post(*args)
      new.post(*args)
    end

    def get(domain:, url:, options: {})
      connection(domain).get(URI.escape(url), options)
    end

    def post(domain:, url:, options: {})
      connection(domain).post do |req|
        req.url URI.escape(url)
        req.headers["Content-Type"] = "application/json"
        req.body = options.to_json
      end
    end

    private

    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def connection(domain)
      Faraday.new(url: domain) do |faraday|
        faraday.request :url_encoded
        faraday.request :request_headers,
                        accept: "application/json",
                        content_type: "application/json"

        if Postcodesio.configuration.verbose
          faraday.use :extended_logging, logger: Postcodesio.configuration.logger
        end

        faraday.response :multi_json,
                         content_type: /\bjson$/,
                         symbolize_keys: true

        faraday.adapter Faraday.default_adapter
      end
    end
    # rubocop:enable Metrics/AbcSize
    # rubocop:enable Metrics/MethodLength
  end
end
