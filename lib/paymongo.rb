require 'json'
require 'net/http'
require 'forwardable'

require 'paymongo/entities/base_entity'
require 'paymongo/entities/payment_intent'

require 'paymongo/api_resource'
require 'paymongo/paymongo_client'
require 'paymongo/paymongo_config'

require 'paymongo/services/base_service'
require 'paymongo/services/payment_intent'

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
