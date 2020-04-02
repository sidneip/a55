module A55
  class Client
    class Instruction
      attr_accessor :client
      def initialize(client)
        self.client = client
      end

      def find(account_id, id) 
        response = client.get("/instruction/#{account_id}/#{id}")
        response.parsed_response
      end

      def where(account_id, options = {})
        response = client.post("/instruction/#{account_id}", options)
        response.parsed_response
      end

      def create(account_id, options = {})
        response = client.post("/instruction/#{account_id}", options)
        response.parsed_response
      end

      def update(id, options = {})
        response = client.post("/instruction/#{account_id}", options)
        response.parsed_response
      end
    end
  end

end