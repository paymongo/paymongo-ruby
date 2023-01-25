module Paymongo
  class PaymentMethod < BaseService
    URI = 'payment_methods'

    def self.create(payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::PaymentMethod,
        path: self::URI,
        payload: payload
      )
    end

    def self.retrieve(id)
      self.request(
        method: :get,
        object: Paymongo::Entities::PaymentMethod,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end
  end
end
