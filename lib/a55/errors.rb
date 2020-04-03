module A55
  class A55Error < StandardError
  end

  class MissingTokenError < A55Error
    def message
      "token is missing, try A55.token = xyz"
    end
  end

  class MissingAccountIdError < A55Error
    def message
     "account_id is required to transaction, please set A55::Client.new(account_id) or A55.account_id = 00"
    end
  end
end