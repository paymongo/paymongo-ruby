module Paymongo
  class PaymongoConfig
    attr_accessor :api_key

    attr_reader :api_base_url,
                :api_version

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    def initialize
      @api_base_url = 'https://api.paymongo.com'
      @api_version = 'v1'
    end
  end
end
