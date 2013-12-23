require 'base64'
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
        binding.pry
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
  end
end
