require 'bundler/setup'
require 'dotenv'
Dotenv.load

module Feed
  VERSION = '0.1.0'.freeze
end

module Feed
  autoload :Cache, 'feed/cache'
  autoload :Commands, 'feed/commands'
  autoload :Config, 'feed/config'
  autoload :Environment, 'feed/environment'
  autoload :Remote, 'feed/remote'
  autoload :Storage, 'feed/storage'
end
