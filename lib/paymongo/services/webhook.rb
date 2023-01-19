module Paymongo
  class Webhook < BaseService
    URI = 'webhooks'

    def self.create(payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::Webhook,
        path: self::URI,
        payload: payload
      )
    end

    def self.retrieve(id)
      self.request(
        method: :get,
        object: Paymongo::Entities::Webhook,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end

    def self.update(id, payload)
      self.request(
        method: :put,
        object: Paymongo::Entities::Webhook,
        path: "#{self::URI}/#{id}",
        payload: payload
      )
    end
  end
end
