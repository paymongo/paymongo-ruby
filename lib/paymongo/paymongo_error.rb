module Paymongo
  class PaymongoError
    attr_reader :code,
                :detail,
                :source

    def initialize(error)
      @code = error['code']
      @detail = error['detail']
      @source = error['source']
    end
  end
end
