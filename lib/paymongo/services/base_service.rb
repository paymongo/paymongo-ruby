module Paymongo
  class BaseService
    def self.request(method:, object:, path:, payload: {})
      response = Paymongo::PaymongoClient.execute_request(
        method: method,
        params: payload,
        path: path
      )

      object.new(response)
    end
  end
end
