module Paymongo
  module Entities
      module Attributes
        module PaymentIntents
          class NextAction < PaymentIntent
            attr_reader :type,
                        :redirect_url,
                        :redirect_return_url

            def initialize(data)
              @type = data['type']
              @redirect_url = data['redirect_url']
              @redirect_return_url = data['redirect_return_url']
            end
          end
        end
      end
  end
end
