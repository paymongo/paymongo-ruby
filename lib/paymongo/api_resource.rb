module Paymongo
  class ApiResource
    attr_reader :id,
                :attributes,
                :data

    def initialize(resource)
      @id = resource['data']['id']
      @attributes = resource['data']['attributes']
      @data = resource['data']
    end
  end
end
