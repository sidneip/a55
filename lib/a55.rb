require "a55/version"
require "a55/configuration"
require "a55/client"
require 'active_support/core_ext/module/delegation'
require 'httparty'

module A55
  class Error < StandardError; end
  class << self
    delegate :env, :env=, :token, :token=, :account_id, :account_id=, to: :configuration

    def production?
      ENV['RAILS_ENV'] == 'production' || self.env == 'production'
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

  def self.authenticate(token)
    HTTParty.post(
      'https://auth-api-hmg.a55.tech/api/auth/signin',
      body: {},
      headers:  {
        "Content-Type" => 'application/json',
        "Authorization" => "ApiKey #{token}"
      }
    ).parsed_response
  end

end
