class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.float :input_amount
      t.string :input_amount_currency
      t.float :output_amount
      t.string :output_amount_currency
      t.float :exchange_rate
      t.timestamps
    end
  end
end
