# frozen_string_literal: true

class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.belongs_to :invoice, index: true
      t.belongs_to :item, index: true
      t.integer :quantity
      t.integer :unit_price

      t.timestamps
    end
  end
end
