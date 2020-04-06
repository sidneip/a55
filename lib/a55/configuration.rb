module A55
  class Configuration
    attr_accessor :token, :env, :account_id
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
    
  end
end