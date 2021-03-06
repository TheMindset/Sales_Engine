# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.belongs_to :merchant, index: true
      t.belongs_to :customer, index: true
      t.integer :status

      t.timestamps
    end
  end
end
