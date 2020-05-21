require "a55/version"
require "a55/configuration"
require "a55/client"
require 'active_support/core_ext/module/delegation'
require 'httparty'

module A55
  class << self
    delegate :env, :env=, :api_token, :api_token=, :account_id, :account_id=, :api_url, :production?, to: :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def authenticate(token = nil)
      app_token = token || api_token || ENV['A55_API_TOKEN']
      raise MissingApiTokenError unless app_token
      response = HTTParty.post(
        "#{configuration.auth_api}",
        body: {},
        headers:  {
          "Content-Type" => 'application/json',
          "Authorization" => "ApiKey #{app_token}"
        }
      ).parsed_response
      response.fetch('user', {}).fetch('token', nil)
    end
  end


end
