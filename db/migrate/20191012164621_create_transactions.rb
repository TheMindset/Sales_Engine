# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.belongs_to :invoice, index: true
      t.integer :credit_card_number
      t.integer :credit_card_expiration_date
      t.integer :result

      t.timestamps
    end
  end
end
