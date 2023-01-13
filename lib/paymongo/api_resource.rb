module Paymongo
  class ApiResource
    attr_reader :id,
                :attributes,
                :data

    def initialize(response)
      @id = response['data']['id']
      @attributes = response['data']['attributes']
      @data = response['data']
    end
  end
end
