module Paymongo
  module Entities
    class Payment < BaseEntity
      attr_reader :id,
                  :access_url,
                  :amount,
                  :balance_transaction_id,
                  :billing,
                  :currency,
                  :description,
                  :disputed,
                  :external_reference_number,
                  :fee,
                  :foreign_fee,
                  :livemode,
                  :metadata,
                  :net_amount,
                  :origin,
                  :payment_intent_id,
                  :payout,
                  :source,
                  :statement_descriptor,
                  :status,
                  :tax_amount,
                  :taxes,
                  :refunds,
                  :available_at,
                  :created_at,
                  :credited_at,
                  :paid_at,
                  :updated_at

      def initialize(api_resource)
        @id = api_resource.id
        @access_url = api_resource.attributes['access_url']
        @amount = api_resource.attributes['amount']
        @balance_transaction_id = api_resource.attributes['balance_transaction_id']
        @billing = BillingEntity.new(api_resource.attributes['billing'])
        @currency = api_resource.attributes['currency']
        @description = api_resource.attributes['description']
        @disputed = api_resource.attributes['disputed']
        @external_reference_number = api_resource.attributes['external_reference_number']
        @fee = api_resource.attributes['fee']
        @foreign_fee = api_resource.attributes['foreign_fee']
        @livemode = api_resource.attributes['livemode']
        @metadata = api_resource.attributes['metadata']
        @net_amount = api_resource.attributes['net_amount']
        @origin = api_resource.attributes['origin']
        @payment_intent_id = api_resource.attributes['payment_intent_id']
        @payout = api_resource.attributes['payout']
        @source = api_resource.attributes['source']
        @statement_descriptor = api_resource.attributes['statement_descriptor']
        @status = api_resource.attributes['status']
        @tax_amount = api_resource.attributes['tax_amount']
        @taxes = api_resource.attributes['taxes']
        @refunds = api_resource.attributes['refunds']
        @available_at = api_resource.attributes['available_at']
        @created_at = api_resource.attributes['created_at']
        @credited_at = api_resource.attributes['credited_at']
        @paid_at = api_resource.attributes['paid_at']
        @updated_at = api_resource.attributes['updated_at']
      end
    end
  end
end
