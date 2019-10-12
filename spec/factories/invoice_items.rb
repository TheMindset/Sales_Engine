# frozen_string_literal: true

# == Schema Information
#
# Table name: invoice_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  unit_price :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  invoice_id :bigint
#  item_id    :bigint
#
# Indexes
#
#  index_invoice_items_on_invoice_id  (invoice_id)
#  index_invoice_items_on_item_id     (item_id)
#

FactoryBot.define do
  factory :invoice_item do
    quantity { 3 }
    unit_price { 74_532 }
    invoice { FactoryBot.create(:invoice) }
    item { FactoryBot.create(:item) }
  end
end
