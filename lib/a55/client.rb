require 'a55'
require 'a55/client/instruction'
require 'a55/client/bank_slip'
require 'a55/errors'
require 'httparty'
module A55
  class Client
    include HTTParty
    base_uri "https://banking-api-hmg.a55.tech"
    attr_reader :account_id
    def initialize(account_id = nil, options = {})
      @token = options[:token] || A55.authenticate
      @account_id = account_id || A55.account_id || ENV['A55_ACCOUNT_ID']
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

    def bank_slip
      @bank_slip_client ||= BankSlip.new(self)
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