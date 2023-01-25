module Paymongo
  class Refund < BaseService
    URI = 'refunds'

    def self.create(payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::Refund,
        path: self::URI,
        payload: payload
      )
    end

    def self.retrieve(id)
      self.request(
        method: :get,
        object: Paymongo::Entities::Refund,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end
  end
end
