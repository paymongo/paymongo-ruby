module Paymongo
  class PaymongoClient
    def self.execute_request(method:, params: {}, path:)
      uri = URI("#{Paymongo.config.api_base_url}/#{Paymongo.config.api_version}/#{path}")

      request = self.initiate_request(method: method, params: params, uri: uri)
      
      request.basic_auth Paymongo.config.api_key, ''

      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        http.request(request)
      end

      json_response_body = JSON.parse(response.body)

      unless self.successful?(response)
        raise StandardError.new(json_response_body['errors'].first['detail'])
      end

      Paymongo::ApiResource.new(json_response_body)
    end

    def self.initiate_request(method:, params: {}, uri:)
      case method
      when :get
        request = Net::HTTP::Get.new(uri)
      when :post
        request = Net::HTTP::Post.new(uri)
        request.body = { data: { attributes: params } }.to_json
        request.set_content_type('application/json')
      end

      request
    end

    def self.successful?(response)
      response.code == '200'
    end
  end
end
