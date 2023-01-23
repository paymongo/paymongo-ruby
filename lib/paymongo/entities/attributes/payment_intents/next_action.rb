module Paymongo
  module Entities
    module Attributes
      module PaymentIntents
        class NextAction < PaymentIntent
          attr_reader :redirect_url,
                      :redirect_return_url,
                      :type,

          def initialize(data)
            @redirect_return_url = data['redirect_return_url']
            @redirect_url = data['redirect_url']
            @type = data['type']
          end
        end
      end
    end
  end
end
