module Paymongo
  class Payment < BaseService
    URI = 'payments'

    def self.retrieve(id)
      self.request(
        method: :get,
        object: Paymongo::Entities::Payment,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end
  end
end
