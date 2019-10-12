# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :unit_price
      t.belongs_to :merchant, index: true

      t.timestamps
    end
  end
end
