module Paymongo
  module Entities
    class Refund < BaseEntity
      attr_reader :id,
                  :amount,
                  :balance_transaction_id,
                  :currency,
                  :livemode,
                  :metadata,
                  :notes,
                  :payment_id,
                  :payout_id,
                  :reason,
                  :status,
                  :available_at,
                  :created_at,
                  :refunded_at,
                  :updated_at

      def initialize(api_resource)
        @id = api_resource.id
        @amount = api_resource.attributes['amount']
        @balance_transaction_id = api_resource.attributes['balance_transaction_id']
        @currency = api_resource.attributes['currency']
        @livemode = api_resource.attributes['livemode']
        @metadata = api_resource.attributes['metadata']
        @notes = api_resource.attributes['notes']
        @payment_id = api_resource.attributes['payment_id']
        @payout_id = api_resource.attributes['payout_id']
        @reason = api_resource.attributes['reason']
        @status = api_resource.attributes['status']
        @available_at = api_resource.attributes['available_at']
        @created_at = api_resource.attributes['created_at']
        @refunded_at = api_resource.attributes['refunded_at']
        @updated_at = api_resource.attributes['updated_at']
      end
    end
  end
end
