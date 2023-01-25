module Paymongo
  module Entities
    class Link < BaseEntity
      attr_reader :id,
                  :amount,
                  :archived,
                  :checkout_url,
                  :currency,
                  :description,
                  :fee,
                  :livemode,
                  :payments,
                  :reference_number,
                  :remarks,
                  :status,
                  :tax_amount,
                  :taxes,
                  :created_at,
                  :updated_at

      def initialize(api_resource)
        @id = api_resource.id
        @amount = api_resource.attributes['amount']
        @archived = api_resource.attributes['archived']
        @checkout_url = api_resource.attributes['checkout_url']
        @currency = api_resource.attributes['currency']
        @description = api_resource.attributes['description']
        @fee = api_resource.attributes['fee']
        @livemode = api_resource.attributes['livemode']
        @payments = api_resource.attributes['payments']
        @reference_number = api_resource.attributes['reference_number']
        @remarks = api_resource.attributes['remarks']
        @status = api_resource.attributes['status']
        @tax_amount = api_resource.attributes['tax_amount']
        @taxes = api_resource.attributes['taxes']
        @created_at = api_resource.attributes['created_at']
        @updated_at = api_resource.attributes['updated_at']
      end
    end
  end
end
