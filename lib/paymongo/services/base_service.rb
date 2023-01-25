module Paymongo
  class BaseService
    def self.request(is_listing: false, method:, object:, path:, payload: {})
      api_resource = Paymongo::PaymongoClient.execute_request(
        method: method,
        params: payload,
        path: path
      )

      if is_listing
        data = api_resource.data.map { |data| object.new(Paymongo::ApiResource.new(data)) }

        Paymongo::Entities::Listing.new(data: data, has_more: api_resource.has_more)
      else
        object.new(api_resource)
      end
    end
  end
end
