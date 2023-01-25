module Paymongo
  module Errors
    class BaseError < StandardError
      attr_reader :data,
                  :errors

      def initialize(data)
        @data = data

        @errors = data['errors'].map do |error|
          PaymongoError.new(error)
        end
      end
    end
  end
end
