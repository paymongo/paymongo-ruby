module Paymongo
  class Webhook < BaseService
    URI = 'webhooks'

    def self.all()
      self.request(
        is_listing: true,
        method: :get,
        object: Paymongo::Entities::Webhook,
        path: self::URI
      )
    end

    def self.construct_event(payload:, signature_header:, webhook_secret_key:)
      unless signature_header.is_a?(String)
        raise Paymongo::Errors::UnexpectedValueError.new('The signature must be a string.')
      end

      signature_array = signature_header.split(',')

      if signature_array.length < 3
        raise Paymongo::Errors::UnexpectedValueError.new("The format of signature #{signature_header} is invalid.")
      end

      timestamp = signature_array[0].split('=')[1]
      test_mode_signature = signature_array[1].split('=')[1]
      live_mode_signature = signature_array[2].split('=')[1]

      unless test_mode_signature.nil?
        comparison_signature = test_mode_signature
      end

      unless live_mode_signature.nil?
        comparison_signature = live_mode_signature
      end

      hash = OpenSSL::HMAC.hexdigest(
        OpenSSL::Digest.new('sha256'),
        webhook_secret_key,
        "#{timestamp}.#{payload}"
      )

      if hash != comparison_signature
        raise Paymongo::Errors::SignatureVerificationError.new('The signature is invalid.')
      end

      api_resource = Paymongo::ApiResource.new(JSON.parse(payload))

      Paymongo::Entities::Event.new(api_resource)
    end

    def self.create(payload)
      self.request(
        method: :post,
        object: Paymongo::Entities::Webhook,
        path: self::URI,
        payload: payload
      )
    end

    def self.disable(id)
      self.request(
        method: :post,
        object: Paymongo::Entities::Webhook,
        path: "#{self::URI}/#{id}/disable"
      )
    end

    def self.enable(id)
      self.request(
        method: :post,
        object: Paymongo::Entities::Webhook,
        path: "#{self::URI}/#{id}/enable"
      )
    end

    def self.retrieve(id)
      self.request(
        method: :get,
        object: Paymongo::Entities::Webhook,
        path: "#{self::URI}/#{id}",
        payload: {}
      )
    end

    def self.update(id, payload)
      self.request(
        method: :put,
        object: Paymongo::Entities::Webhook,
        path: "#{self::URI}/#{id}",
        payload: payload
      )
    end
  end
end
