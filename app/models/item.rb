# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  unit_price  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  merchant_id :bigint
#
# Indexes
#
#  index_items_on_merchant_id  (merchant_id)
#

class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.items_by_invoice(invoice_id)
    joins(:invoices).where(invoices: { id: invoice_id })
  end

  def self.merchant_for_item(item_id)
    joins(:merchant).where(items: { id: item_id })[0].merchant
  end

  def self.most_revenue(quantity)
    joins(:invoice_items).select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
                         .group(:id)
                         .order("revenue DESC")
                         .limit(quantity)
  end

  def self.date_of_highset_sales(item_id)
    joins(:invoices)
      .where(items: { id: item_id })
      .select('items.id, items.name, sum(invoice_items.quantity) AS revenue, invoices.created_at::date AS best_day')
      .group(:best_day)
      .group(:id)
      .order("best_day ASC")
      .order("revenue ASC")
      .limit(1)
  end
end
