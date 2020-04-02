require "a55/version"
require "a55/configuration"
require "a55/client"
require 'active_support/core_ext/module/delegation'

module A55
  class Error < StandardError; end
  class << self
    delegate :env, :env=, :token, :token=, to: :configuration

    def production?
      ENV['RAILS_ENV'] == 'production' || self.env == 'production'
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

  # Your code goes here...
end
