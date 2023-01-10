module Paymongo
  class PaymentIntent < BaseService
    URI = 'payment_intents'

    def self.create(payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::PaymentIntent,
        path: self::URI,
        payload: payload
      )
    end

    def self.retrieve(id:)
      self.request(
        method: :get,
        object: Paymongo::Entities::PaymentIntent,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end
  end
end
