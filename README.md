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
```

## Verifying webhook signature

- TBD
