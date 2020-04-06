module A55
  class A55Error < StandardError
  end

  class MissingTokenError < A55Error
    def message
      "token is missing, try A55.token = xyz"
    end
  end

  class MissingApiTokenError < A55Error
    def message
      "API TOKEN is missing, please set by env A55_API_TOKEN or provide in method params A55.authenticate(token)"
    end
  end

  class MissingAccountIdError < A55Error
    def message
     "account_id is required to transaction, please set A55::Client.new(account_id) or A55.account_id = 00"
    end
  end
end