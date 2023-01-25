Gem::Specification.new do |s|
  s.name        = "paymongo"
  s.version     = "0.1.0"
  s.summary     = "PayMongo Ruby"
  s.description = "PayMongo Ruby Library"
  s.author      = "PayMongo"
  s.email       = "support@paymongo.com"
  s.files       = [
    "lib/paymongo.rb",
    "lib/paymongo/entities/base_entity.rb",
    "lib/paymongo/entities/billing_entity.rb",
    "lib/paymongo/entities/customer.rb",
    "lib/paymongo/entities/link.rb",
    "lib/paymongo/entities/listing.rb",
    "lib/paymongo/entities/payment.rb",
    "lib/paymongo/entities/payment_intent.rb",
    "lib/paymongo/entities/payment_method.rb",
    "lib/paymongo/entities/refund.rb",
    "lib/paymongo/entities/webhook.rb",
    "lib/paymongo/entities/attributes/payment_intents/next_action.rb",
    "lib/paymongo/errors/authentication_error.rb",
    "lib/paymongo/errors/base_error.rb",
    "lib/paymongo/errors/invalid_request_error.rb",
    "lib/paymongo/errors/resource_not_found_error.rb",
    "lib/paymongo/api_resource.rb",
    "lib/paymongo/paymongo_client.rb",
    "lib/paymongo/paymongo_config.rb",
    "lib/paymongo/paymongo_error.rb",
    "lib/paymongo/services/base_service.rb",
    "lib/paymongo/services/customer.rb",
    "lib/paymongo/services/link.rb",
    "lib/paymongo/services/payment.rb",
    "lib/paymongo/services/payment_intent.rb",
    "lib/paymongo/services/payment_method.rb",
    "lib/paymongo/services/refund.rb",
    "lib/paymongo/services/webhook.rb",
  ]
  s.homepage    = "https://developers.paymongo.com/docs/introduction"
  s.license     = "MIT"
end
