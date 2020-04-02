require 'a55/client/instruction'
require 'a55/errors'
require 'httparty'
module A55
  class Client
    include HTTParty
    base_uri "https://banking-api-hmg.a55.tech"
    def initialize token = nil
      @token = token || A55.token || ENV['A55_TOKEN']
      raise A55::MissingTokenError unless @token
      self.class.default_options.merge!(headers: { 'Authorization' => "Token #{@token}", 'Content-Type' => 'application/json'}, verify: A55.production? )
    end

    def perform_request(path)
      response = self.class.get(path)
      response
    end

    def instructions
      @instruction_client ||= Instruction.new(self)
    end
    
    def get(path, options  = {})
      self.class.get(path, options)
    end

    def post(path, options = {})
      self.class.post(path, body: options.to_json, headers: default_headers)
    end

    def put(path, options = {})
      self.class.put(path, body: options.to_json, headers: default_headers)
    end

    private
    def default_headers
      { 'Content-Type' => 'application/json' }
    end
  end
end