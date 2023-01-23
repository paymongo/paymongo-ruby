module Paymongo
  class Customer < BaseService
    URI = 'customers'

    def self.create(payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::Customer,
        path: self::URI,
        payload: payload
      )
    end

    def self.delete(id)
      self.request(
        method: :delete,
        object: Paymongo::Entities::Customer,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end

    def self.retrieve(id)
      self.request(
        method: :get,
        object: Paymongo::Entities::Customer,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end

    def self.update(id, payload)
      self.request(
        method: :put,
        object: Paymongo::Entities::Customer,
        path: "#{self::URI}/#{id}",
        payload: payload
      )
    end
  end
end