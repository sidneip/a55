module A55
  class Configuration
    attr_accessor :api_token, :env, :account_id
    attr_reader :api_url
    def initialize
      @token = nil
      @env = nil
    end

    def api_url
      if production?
        "https://banking-api.a55.tech"
      else
        "https://banking-api-hmg.a55.tech"
      end
    end
    
    def production?
      ENV['RAILS_ENV'] == 'production' || self.env == 'production'
    end

    def auth_api
      if production?
        'https://auth-api.a55.tech/api/auth/signin'
      else
        'https://auth-api-hmg.a55.tech/api/auth/signin'
      end
    end
    
  end
end