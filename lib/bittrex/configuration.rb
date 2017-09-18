require 'singleton'

module Bittrex
  class Configuration
    include Singleton

    attr_accessor :key, :secret


    def self.defaults
      {
        key: ENV['bittrex_api_key'],
        secret: ENV['bittrex_api_key'],
      }
    end

    def initialize
      reset
    end

    def auth
      {
        key: key,
        secret: secret
      }
    end

    def reset
      self.class.defaults.each_pair { |k, v| send("#{k}=", v) }
    end
  end
end
