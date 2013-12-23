require 'base64'
require 'json'
require 'excon'
require 'pry'

module Feed
  module Remote
    class Feedbin
      BASE_URL = 'https://api.feedbin.me/'

      def initialize(username, password, cache)
        @username, @password = username, password
        @cache = cache

        @connection = build_connection
      end

      def get_subscriptions
        params = { path: '/v2/subscriptions.json' }
        response = @connection.get(params)
        response.extend ResponseHelper

        response.success? ?
          JSON.parse(response.body) :
          []
      end

      def get_latest_entries
        []
      end

      protected

      def build_connection
        base_params = { user: @username, password: @password }
        Excon.new(BASE_URL, base_params)
      end

    end

    module ResponseHelper
      SUCCESS = (200..299)

      def success?
        SUCCESS === status
      end
    end
  end
end
