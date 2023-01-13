module Paymongo
  class BaseService
    def self.request(method:, object:, path:, payload: {})
      api_resource = Paymongo::PaymongoClient.execute_request(
        method: method,
        params: payload,
        path: path
      )

      object.new(api_resource)
    end
  end
end
