module Paymongo
  module Entities
    class PaymentIntent < BaseEntity
      attr_reader :id,
                  :amount,
                  :capture_type,
                  :client_key,
                  :currency,
                  :description,
                  :livemode,
                  :statement_descriptor,
                  :status,
                  :last_payment_error,
                  :payment_method_allowed,
                  :payments,
                  :next_action,
                  :payment_method_options,
                  :metadata,
                  :setup_future_usage,
                  :created_at,
                  :updated_at

      def initialize(resource)
        @id = resource['data']['id']
        @amount = resource['data']['attributes']['amount']
        @capture_type = resource['data']['attributes']['capture_type']
        @client_key = resource['data']['attributes']['client_key']
        @currency = resource['data']['attributes']['currency']
        @description = resource['data']['attributes']['description']
        @livemode = resource['data']['attributes']['livemode']
        @statement_descriptor = resource['data']['attributes']['statement_descriptor']
        @status = resource['data']['attributes']['status']
        @last_payment_error = resource['data']['attributes']['last_payment_error']
        @payment_method_allowed = resource['data']['attributes']['payment_method_allowed']
        @payments = resource['data']['attributes']['payments']
        @next_action = resource['data']['attributes']['next_action']
        @payment_method_options = resource['data']['attributes']['payment_method_options']
        @metadata = resource['data']['attributes']['metadata']
        @setup_future_usage = resource['data']['attributes']['setup_future_usage']
        @created_at = resource['data']['attributes']['created_at']
        @updated_at = resource['data']['attributes']['updated_at']
      end
    end
  end
end
