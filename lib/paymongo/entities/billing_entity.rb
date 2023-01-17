module Paymongo
  module Entities
    class BillingEntity < BaseEntity
      attr_reader :id,
                  :address_city,
                  :address_country,
                  :address_line1,
                  :address_line2,
                  :address_postal_code,
                  :address_state,
                  :email,
                  :name,
                  :phone

      def initialize(data)
        @address_city = data['address']['city']
        @address_country = data['address']['country']
        @address_line1 = data['address']['line1']
        @address_line2 = data['address']['line2']
        @address_postal_code = data['address']['postal_code']
        @address_state = data['address']['state']
        @email = data['email']
        @name = data['name']
        @phone = data['phone']
      end
    end
  end
end
