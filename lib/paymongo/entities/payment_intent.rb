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
                  :payment_method,
                  :payment_method_allowed,
                  :payments,
                  :next_action,
                  :payment_method_options,
                  :metadata,
                  :setup_future_usage,
                  :created_at,
                  :updated_at

      def initialize(api_resource)
        @id = api_resource.id
        @amount = api_resource.attributes['amount']
        @capture_type = api_resource.attributes['capture_type']
        @client_key = api_resource.attributes['client_key']
        @currency = api_resource.attributes['currency']
        @description = api_resource.attributes['description']
        @livemode = api_resource.attributes['livemode']
        @statement_descriptor = api_resource.attributes['statement_descriptor']
        @status = api_resource.attributes['status']
        @last_payment_error = api_resource.attributes['last_payment_error']
        @payment_method_allowed = api_resource.attributes['payment_method_allowed']
        @payments = api_resource.attributes['payments'] #TODO: ENG-21218 PayMongo-Ruby - Map payments attribute to array of payment entities
        @next_action = next_action(api_resource.attributes['next_action'])
        @payment_method = api_resource.attributes['payment_method']
        @payment_method_options = api_resource.attributes['payment_method_options']
        @metadata = api_resource.attributes['metadata']
        @setup_future_usage = api_resource.attributes['setup_future_usage']
        @created_at = api_resource.attributes['created_at']
        @updated_at = api_resource.attributes['updated_at']
      end

      def next_action(data)
        return nil if data.nil? || data.empty?

        Attributes::PaymentIntents::NextAction.new(data)
      end
    end
  end
end
