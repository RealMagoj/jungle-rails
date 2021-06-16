# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

4242424242424242	Visa	Any 3 digits	Any future date
4000056655665556	Visa (debit)	Any 3 digits	Any future date
5555555555554444	Mastercard	Any 3 digits	Any future date
2223003122003222	Mastercard (2-series)	Any 3 digits	Any future date
5200828282828210	Mastercard (debit)	Any 3 digits	Any future date
5105105105105100	Mastercard (prepaid)	Any 3 digits	Any future date
378282246310005	American Express	Any 4 digits	Any future date
371449635398431	American Express	Any 4 digits	Any future date
6011111111111117	Discover	Any 3 digits	Any future date
6011000990139424	Discover	Any 3 digits	Any future date
3056930009020004	Diners Club	Any 3 digits	Any future date
36227206271667	Diners Club (14 digit card)	Any 3 digits	Any future date
3566002020360505	JCB	Any 3 digits	Any future date
6200000000000005	UnionPay	Any 3 digits	Any future date

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
