# AZA FINANCE FX API

A microservice to store FX transactions

## Endpoints
1. `POST /transactions`: create a new transaction
2. `GET /transactions`: list all transactions in the system
3. `GET /transactions/<id>`: get the specific transaction by ID

All trasanction needs `:customer_id, :input_amount, :input_amount_currency, :output_amount_currency, :exchange_rate`

## Installation

1) `git clone https://github.com/nelsonabieno/aza_transact_api.git`
2) `cd aza_transact_api`
3) `bundle install`
4) `rails s`

## Test

Run `rspec`

