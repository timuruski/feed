module Feed
  class Environment
    DEFAULT_PATH = File.expand_path('~/.feed')

    # Environment path can be:
    #  - argument
    #  - ENV['FEED_PATH']
    #  - default: ~/.feed
    def self.build(base_path = nil)
      base_path ||= ENV.fetch('FEED_PATH', DEFAULT_PATH)
      self.new(base_path)
    end


    def initialize(base_path)
      @base_path = Pathname.new(base_path)

      @config = Config.load(@base_path)

      @cache = Cache::FileSystem.new(cache_path)
      @remote_store = Remote::Feedbin.new(@config.remote_username, @config.remote_password, @cache)
      @local_store = Storage::FileSystem.new(store_path)
    end

    attr_reader :cache, :remote_store, :local_store

    def cache_path
      @base_path.join('cache')
    end

    def store_path
      @base_path.join('store')
    end
  end
end
