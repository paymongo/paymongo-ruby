module Paymongo
  class Link < BaseService
    URI = 'links'

    def self.all(payload)
      self.request(
        is_listing: true,
        method: :get,
        object: Paymongo::Entities::Link,
        path: self::URI,
        payload: payload
      )
    end

    def self.archive(id)
      self.request(
        method: :post,
        object: Paymongo::Entities::Link,
        path: "#{self::URI}/#{id}/archive"
      )
    end

    def self.create(payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::Link,
        path: self::URI,
        payload: payload
      )
    end

    def self.retrieve(id)
      self.request(
        method: :get,
        object: Paymongo::Entities::Link,
        path: "#{self::URI}/#{id}"
      )
    end

    def self.unarchive(id)
      self.request(
        method: :post,
        object: Paymongo::Entities::Link,
        path: "#{self::URI}/#{id}/unarchive"
      )
    end
  end
end
