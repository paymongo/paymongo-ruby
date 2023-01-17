require 'json'
require 'net/http'
require 'forwardable'

require 'paymongo/entities/base_entity'
require 'paymongo/entities/billing_entity'
require 'paymongo/entities/link'
require 'paymongo/entities/listing'
require 'paymongo/entities/payment'
require 'paymongo/entities/payment_intent'
require 'paymongo/entities/payment_method'
require 'paymongo/entities/refund'
require 'paymongo/entities/webhook'

require 'paymongo/entities/attributes/payment_intents/next_action'

require 'paymongo/api_resource'
require 'paymongo/paymongo_client'
require 'paymongo/paymongo_config'

require 'paymongo/services/base_service'
require 'paymongo/services/link'
require 'paymongo/services/payment'
require 'paymongo/services/payment_intent'
require 'paymongo/services/payment_method'
require 'paymongo/services/refund'
require 'paymongo/services/webhook'

module Paymongo
  @config = Paymongo::PaymongoConfig.setup

  class << self
    extend Forwardable

    attr_reader :config

    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :api_base_url, :api_base_url=
    def_delegators :@config, :api_version, :api_version=
  end
end
