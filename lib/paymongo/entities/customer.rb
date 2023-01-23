module Paymongo
  module Entities
    class Customer < BaseEntity
      attr_reader :id,
                  :default_device,
                  :default_payment_method_id,
                  :deleted,
                  :email,
                  :first_name,
                  :last_name,
                  :livemode,
                  :phone,
                  :type,
                  :created_at,
                  :updated_at

      def initialize(api_resource)
        @id = api_resource.id
        @default_device = api_resource.attributes['default_device']
        @default_payment_method_id = api_resource.attributes['default_payment_method_id']
        @deleted = api_resource.attributes['deleted']
        @email = api_resource.attributes['email']
        @first_name = api_resource.attributes['first_name']
        @last_name = api_resource.attributes['last_name']
        @livemode = api_resource.attributes['livemode']
        @phone = api_resource.attributes['phone']
        @type = api_resource.data['type']
        @created_at = api_resource.attributes['created_at']
        @updated_at = api_resource.attributes['updated_at']
      end
    end
  end
end