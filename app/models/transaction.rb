class Transaction < ApplicationRecord
  validates :customer_id, numericality: { only_integer: true }
  validates :input_amount, numericality: true
  validates :input_amount_currency, presence: true
  validates :output_amount_currency, presence: true
  validates :exchange_rate, numericality: true
end