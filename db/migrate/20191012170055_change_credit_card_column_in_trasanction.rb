# frozen_string_literal: true

class ChangeCreditCardColumnInTrasanction < ActiveRecord::Migration[5.2]
  def change
    change_column :transactions, :credit_card_number, :integer, limit: 8
    change_column :transactions, :credit_card_expiration_date, :text
  end
end
