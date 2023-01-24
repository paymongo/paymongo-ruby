module Paymongo
  class PaymongoClient
    def self.execute_request(method:, params: {}, path:)
      uri = URI("#{Paymongo.config.api_base_url}/#{Paymongo.config.api_version}/#{path}")

      request = self.initiate_request(method: method, params: params, uri: uri)

      request.basic_auth Paymongo.config.api_key, ''

      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        http.request(request)
      end

      self.handle_error(response) unless self.successful?(response)

      json_response_body = JSON.parse(response.body)

      Paymongo::ApiResource.new(json_response_body)
    end

    private_class_method def self.handle_error(response)
      json_response_body = JSON.parse(response.body)

      case response.code
      when '400'
        raise Paymongo::Errors::InvalidRequestError.new(json_response_body)
      when '401'
        raise Paymongo::Errors::AuthenticationError.new(json_response_body)
      when '404'
        raise Paymongo::Errors::ResourceNotFoundError.new(json_response_body)
      else
        raise Paymongo::Errors::BaseError.new(json_response_body)
      end
    end

    private_class_method def self.initiate_request(method:, params: {}, uri:)
      case method
      when :get
        unless params.empty?
          encoded_params = URI.encode_www_form(params)
          uri = [uri, encoded_params].join('?')
        end

        request = Net::HTTP::Get.new(uri)
      when :post
        request = Net::HTTP::Post.new(uri)
        request.body = { data: { attributes: params } }.to_json
        request.set_content_type('application/json')
      when :put
        request = Net::HTTP::Put.new(uri)
        request.body = { data: { attributes: params } }.to_json
        request.set_content_type('application/json')
      end

      request
    end

    private_class_method def self.successful?(response)
      response.code == '200'
    end
  end
end
