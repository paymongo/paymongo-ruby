module Paymongo
  module Entities
    class PaymentMethod < BaseEntity
      attr_reader :id,
                  :billing,
                  :details,
                  :livemode,
                  :metadata,
                  :source_id,
                  :type,
                  :created_at,
                  :updated_at

      def initialize(api_resource)
        @id = api_resource.id
        @billing = BillingEntity.new(api_resource.attributes['billing'])
        @details = api_resource.attributes['details']
        @livemode = api_resource.attributes['livemode']
        @metadata = api_resource.attributes['metadata']
        @source_id = api_resource.attributes['source_id']
        @type = api_resource.attributes['type']
        @created_at = api_resource.attributes['created_at']
        @updated_at = api_resource.attributes['updated_at']
      end
    end
  end
end
