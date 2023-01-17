# PayMongo Ruby Library

PayMongo Ruby library provides ruby applications an easy access to the PayMongo API. Explore various classes that can represent API resources on object instantiation. The goal of this library is simplify PayMongo integration with any ruby application.

## Pending TODOs

- TBD

## Documentation

See the [PayMongo API docs](https://developers.paymongo.com/reference/getting-started-with-your-api).

### Requirements

- Ruby 2.3+.

## Installation

You don't need this source code unless you want to modify the gem. If you just
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

# retrieve payment
Paymongo::Payment.retrieve('pay_...')

# retrieve payment intent
Paymongo::PaymentIntent.retrieve('pi_...')

# create payment intent
payment_intent = Paymongo::PaymentIntent.create(
  amount: 10000,
  currency: 'PHP',
  description: 'Dog Treat',
  payment_method_allowed: ['gcash']
)

# retrieve payment intent id attribute
payment_intent.id
 => "pi_qMSGj3UoBYm8BR3XDjcGZJHG"

# retrieve payment intent status attribute
payment_intent.status
 => "awaiting_payment_method"

# retrieve payment method
Paymongo::PaymentMethod.retrieve('pm_BhBBmUpQrbkFquBdBL5JxhuG')

# create payment method
payment_method = Paymongo::PaymentMethod.create({
  type: 'gcash',
  billing: {
    "address": {
      "line1": "test line 1",
      "line2": "test line 2",
      "city": "Antipolo",
      "state": "Rizal",
      "postal_code": "1870",
      "country": "PH"
    },
    "email": "travis-spd@gmail.comm",
    "name": "John Dog",
    "phone": "09123456789"
  }
})

# retrieve refund
Paymongo::Refund.retrieve('ref_gThWxhe9WtbFEZWmY2Qwzm6K')

# create refund
Paymongo::Refund.create(
  amount: 10000,
  payment_id: 'pay_H7igga6VQtGTbkJ35AHuQ4rM',
  reason: 'requested_by_customer',
  metadata: {
    merchant: 'test value'

# retrieve webhook
Paymongo::Webhook.retrieve('hook_W5thFLFVmWDze1kMR7EB4o2c')

# create webhook
webhook = Paymongo::Webhook.create(
  events: ['payment.refunded', 'payment.refund.updated'],
  url: 'http://localhost:3100/webhook'
)

# update webhook
webhook = Paymongo::Webhook.update('hook_W5thFLFVmWDze1kMR7EB4o2c',
  {
      events: ['payment.paid'],
      url: 'http://localhost:3101/webhook'
  }
)
```

## Links

```ruby
link = Paymongo::Link.retrieve('link_...')

link = Paymongo::Link.archive(link.id)

link = Paymongo::Link.unarchive(link.id)

Paymongo::Link.create(
  amount: 10000,
  description: 'link description',
  remarks: 'link remarks'
)

links = Paymongo::Link.all(reference_number: '1234abc')
# attach PIPM
payment_intent = Paymongo::PaymentIntent.create({
  "amount": 300000,
  "payment_method_allowed": [
    "gcash"
  ],
  "description": "Bone brush",
  "statement_descriptor": "BarkerShop",
  "currency": "PHP"
})

payment_method = Paymongo::PaymentMethod.create({
  type: 'gcash',
  billing: {
    "address": {
      "line1": "test line 1",
      "line2": "test line 2",
      "city": "Antipolo",
      "state": "Rizal",
      "postal_code": "1870",
      "country": "PH"
    },
    "email": "travis-spd@gmail.comm",
    "name": "Miguel Mercado",
    "phone": "09272582291"
  }
})

Paymongo::PaymentIntent.attach(payment_intent.id, {
  payment_method: payment_method.id,
  return_url: 'https://test/success'
})

# cancel payment intent
payment_intent = Paymongo::PaymentIntent.create({
  "amount": 300000,
  "payment_method_allowed": [
    "gcash"
  ],
  "description": "Bone brush",
  "statement_descriptor": "BarkerShop",
  "currency": "PHP"
})

Paymongo::PaymentIntent.cancel(payment_intent.id)

# capture payment intent
payment_intent = Paymongo::PaymentIntent.create({
  "amount": 10000,
  "payment_method_allowed": [
    "card"
  ],
  "payment_method_options": {
    "card": {
      "request_three_d_secure": "any"
    }
  },
  "description": "Ube Cheese Pandesal",
  "statement_descriptor": "BakeryShop",
  "currency": "PHP",
  "capture_type": "manual"
})

payment_method = Paymongo::PaymentMethod.create({
  "type": "card",
  "details": {
    "card_number": "5111111111111118",
    "exp_month": 3,
    "exp_year": 2025,
    "cvc": "123"
  },
  "billing": {
    "address": {
      "line1": "test line 1",
      "line2": "test line 2",
      "city": "Antipolo",
      "state": "Rizal",
      "postal_code": "1870",
      "country": "PH"
    },
    "email": "juan@gmail.comm",
    "name": "Juan dela cruz",
    "phone": "09176318683"
  }
})

attach = Paymongo::PaymentIntent.attach(payment_intent.id, {
  payment_method: payment_method.id
})

Paymongo::PaymentIntent.capture(payment_intent.id, {"amount": payment_intent.amount})
```

## Verifying webhook signature

- TBD
