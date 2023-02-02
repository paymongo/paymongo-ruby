module Paymongo
  module Entities
    class Event < BaseEntity
      attr_reader :id,
                  :resource,
                  :type

      def initialize(api_resource)
        @id = api_resource.id
        @resource = api_resource.attributes['data']
        @type = api_resource.attributes['type']
      end
    end
  end
end
