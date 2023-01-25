module Paymongo
  class ApiResource
    attr_reader :id,
                :attributes,
                :data,
                :has_more

    def initialize(response)
      @data = response['data'] || response

      if @data.respond_to?(:has_key?) && @data.has_key?('attributes')
        @id = @data['id']
        @attributes = @data['attributes']
      end

      @has_more = response['has_more']
    end
  end
end
