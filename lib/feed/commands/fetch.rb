module Feed
  module Commands
    class Fetch
      def self.run(base_path = ENV['FEED_PATH'], args = ARGV)
        env = Environment.new(base_path)
        self.new(env).run(args)
      end


      def initialize(env)
        @remote = env.remote_store
        @local = env.local_store
      end

      def run(args)
        puts @remote.get_subscriptions
        # entries = @remote_store.get_latest_entries
        # entries.each do |entry|
        #   puts entry
        #   # @local_store.store(entry)
        # end
      end
    end
  end
end
