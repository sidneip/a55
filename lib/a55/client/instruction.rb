module A55
  class Client
    class Instruction
      attr_accessor :client
      def initialize(client)
        self.client = client
        raise A55::MissingAccountIdError unless client.account_id
      end

      def find(id) 
        response = client.get("/instruction/#{client.account_id}/#{id}")
        response.parsed_response
      end

      def where(options = {})
        response = client.post("/instruction/#{client.account_id}", options)
        response
      end

      def create(options = {})
        response = client.post("/instruction/#{client.account_id}/create", options)
        response.parsed_response
      end

      def update(options = {})
        response = client.post("/instruction/#{client.account_id}/create", options)
        response.parsed_response
      end
    end
  end

end