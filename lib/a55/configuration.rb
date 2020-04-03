module A55
  class Configuration
    attr_accessor :token, :env, :account_id
    def initialize
      @token = nil
      @env = nil
    end
    
  end
end