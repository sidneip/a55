module A55
  class A55Error < StandardError
  end

  class MissingTokenError < A55Error
    def message
      "token is missing, try A55.token = xyz"
    end
  end
end