Gem::Specification.new do |s|
  s.name        = "paymongo"
  s.version     = "0.0.0"
  s.summary     = "PayMongo Ruby"
  s.description = "PayMongo Ruby Library"
  s.author      = "PayMongo"
  s.email       = "support@paymongo.com"
  s.files       = [
    "lib/paymongo.rb",
    "lib/paymongo/entities/base_entity.rb",
    "lib/paymongo/entities/payment_intent.rb",
    "lib/paymongo/api_resource.rb",
    "lib/paymongo/paymongo_client.rb",
    "lib/paymongo/paymongo_config.rb",
    "lib/paymongo/services/base_service.rb",
    "lib/paymongo/services/payment_intent.rb",
  ]
  s.homepage    = "https://rubygems.org/gems/paymongo-ruby"
  s.license     = "MIT"
end
