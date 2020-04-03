module A55
  class Client
    class BankSlip
      attr_accessor :client
      def initialize(client)
        self.client = client
        raise A55::MissingAccountIdError unless client.account_id
      end

      def find(id)
        response = client.get("/boleto/#{client.account_id}/#{id}")
        response.parsed_response
      end

      def where(options = {})
        response = client.post("/boleto/search/#{client.account_id}", options)
        response.parsed_response
      end

      def export(options = {}) 
        response = client.post("/boleto/#{client.account_id}/export", options)
        response.parsed_response
      end


      def download(bank_slip_id)
        response = client.get("/boleto/#{client.account_id}/#{bank_slip_id}/pdf")
        response.parsed_response
      end

    end
  end

end