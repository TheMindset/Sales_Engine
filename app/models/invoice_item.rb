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

class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  def self.find_all_invoices_for_item(item_id)
    joins(:item).where(items: { id: item_id })
  end
end
