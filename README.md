# PayMongo Ruby Library

PayMongo Ruby library provides ruby applications an easy access to the PayMongo API. Explore various classes that can represent API resources on object instantiation. The goal of this library is simplify PayMongo integration with any ruby application.

## Pending TODOs

- Publish to rubygems
- Unit Tests

## Documentation

See the [PayMongo API docs](https://developers.paymongo.com/reference/getting-started-with-your-api).

### Requirements

- Ruby 2.3+.

## Installation

**TODO** You don't need this source code unless you want to modify the gem. If you just
want to use the package, just run:

```sh
gem install paymongo
```

If you want to build the gem from source:

```sh
gem build paymongo.gemspec
```

## Usage

The library needs to be configured with your account's secret key which is
available in your [PayMongo Dashboard][api-keys]. Initialize the library to its
value:

```ruby
require 'paymongo'

# set api key config
Paymongo.api_key = 'sk_test_...'

# Payment Method
payment_method = Paymongo::PaymentMethod.retrieve('pm_...')

# Retrieve attributes
payment_method.id
 => "pm_..."

payment_method.type
 => "card"

Paymongo::PaymentMethod.create(
  type: 'gcash',
  billing: {
    address: {
      line1: 'test line 1',
      line2: 'test line 2',
      city: 'Antipolo',
      state: 'Rizal',
      postal_code: '1870',
      country: 'PH'
    },
    email: 'test@paymongo.com',
    name: 'Pay Mongo',
    phone: '09123456789'
  }
)

# Payment Intent
Paymongo::PaymentIntent.retrieve('pi_...')

Paymongo::PaymentIntent.create(
  amount: 10000,
  currency: 'PHP',
  description: 'Dog Treat',
  payment_method_allowed: ['gcash']
)

Paymongo::PaymentIntent.attach('pi_...', {
  payment_method: 'pm_...',
  return_url: 'https://test/success'
})

Paymongo::PaymentIntent.cancel('pi_...')

Paymongo::PaymentIntent.capture('pi_...', {
  amount: payment_intent.amount
})

# Payment
Paymongo::Payment.retrieve('pay_...')

# Refund
Paymongo::Refund.retrieve('ref_...')

Paymongo::Refund.create(
  amount: 10000,
  payment_id: 'pay_...',
  reason: 'requested_by_customer',
  metadata: {
    merchant: 'test value'
  }
)
```

## Customers

```ruby
Paymongo::Customer.create(
  default_device: 'phone',
  email: 'test@paymongo.com',
  first_name: 'Pay',
  last_name: 'Mongo',
  phone: '+624123456789',
)

Paymongo::Customer.retrieve('cus_...')

Paymongo::Customer.update('cus_...', {
  default_device: 'phone',
  email: 'test@paymongo.com',
  first_name: 'Pay_',
  last_name: 'Mongo_',
  phone: '+649223456789',
})

Paymongo::Customer.delete('cus_...')
```

## Links

```ruby
Paymongo::Link.retrieve('link_...')

Paymongo::Link.archive('link_...')

Paymongo::Link.unarchive('link_...')

Paymongo::Link.create(
  amount: 10000,
  description: 'link description',
  remarks: 'link remarks'
)

links = Paymongo::Link.all(reference_number: '1234abc')
```

## Webhooks

```ruby
Paymongo::Webhook.retrieve('hook_...')

Paymongo::Webhook.create(
  events: ['payment.refunded', 'payment.refund.updated'],
  url: 'http://localhost:3100/webhook'
)

Paymongo::Webhook.disable('hook_...')

Paymongo::Webhook.enable('hook_...')

Paymongo::Webhook.update('hook_...', {
  events: ['payment.paid'],
  url: 'http://localhost:3101/webhook'
})

webhooks = Paymongo::Webhook.all()
```

## Handle errors

```ruby
begin
  payment_intent = Paymongo::PaymentIntent.retrieve('pi_...')
rescue Paymongo::Errors::AuthenticationError => e
  # Handle error
  puts e.errors.first.code
  puts e.errors.first.detail
  puts e.errors.first.source
end
```

## Verifying webhook signature

```ruby
begin
  payload = '{"data":{"id":"evt_...","type":"event","attributes":{"type":"source.chargeable"},"created_at":1675323264}}}'
  signature_header = 't=1675323267,te=,li=99f...'
  webhook_secret_key = 'whsk_...'

  event = Paymongo::Webhook.construct_event(
    payload: payload,
    signature_header: signature_header,
    webhook_secret_key: webhook_secret_key
  )

  event.id
  event.type
  event.resource
rescue Paymongo::Errors::SignatureVerificationError => e
  # Handle invalid signature
end
```
