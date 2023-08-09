module Paymongo
  class PaymentIntent < BaseService
    URI = 'payment_intents'

    def self.attach(id, payload)
      payload[:origin] = 'ruby'

      self.request(
        method: :post,
        object: Paymongo::Entities::PaymentIntent,
        path: "#{self::URI}/#{id}/attach",
        payload: payload
      )
    end

    def self.cancel(id)
      self.request(
        method: :post,
        object: Paymongo::Entities::PaymentIntent,
        path: "#{self::URI}/#{id}/cancel",
        payload: {}
      )
    end

    def self.capture(id, payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::PaymentIntent,
        path: "#{self::URI}/#{id}/capture",
        payload: payload
      )
    end

    def self.create(payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::PaymentIntent,
        path: self::URI,
        payload: payload
      )
    end

    def self.retrieve(id)
      self.request(
        method: :get,
        object: Paymongo::Entities::PaymentIntent,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end
  end
end
