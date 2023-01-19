module Paymongo
  module Entities
    class Webhook < BaseEntity
      attr_reader :id,
                  :events,
                  :livemode,
                  :status,
                  :secret_key,
                  :url,
                  :created_at,
                  :updated_at

      def initialize(api_resource)
        @id = api_resource.id
        @events = api_resource.attributes['events']
        @livemode = api_resource.attributes['livemode']
        @status = api_resource.attributes['status']
        @secret_key = api_resource.attributes['secret_key']
        @url = api_resource.attributes['url']
        @created_at = api_resource.attributes['created_at']
        @updated_at = api_resource.attributes['updated_at']
      end
    end
  end
end
