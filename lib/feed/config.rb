require 'ostruct'
require 'pathname'
require 'yaml'

module Feed
  class Config
    CONFIG_NAME = 'config.yml'

    def self.load(base_path)
      config_path = Pathname.new(base_path).join(CONFIG_NAME)
      self.new(config_path)
    end

    def initialize(config_path)
      data = YAML.load_file(config_path)

      remote_config = data.fetch('remote')
      @remote_username = remote_config.fetch('username')
      @remote_password = remote_config.fetch('password')
    end

    attr_reader :remote_adaptor, :remote_username, :remote_password

  end
end
