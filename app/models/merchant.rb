# frozen_string_literal: true

# == Schema Information
#
# Table name: merchants
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.merchant_by_invoice(invoice_id)
    joins(:invoices).where(invoices: { id: invoice_id })
  end

  def self.most_revenue(quantity)
    joins(invoices: [:invoice_items, :transactions])
      .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .merge(Transaction.successful)
      .group(:id)
      .order("revenue DESC")
      .limit(quantity)
  end

  def self.date_revenue(date)
    joins(invoices: [:invoice_items, :transactions])
      .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .merge(Transaction.successful)
      .merge(Invoice.select_date(date))
      .group(:id)
      .order("revenue DESC")
  end
end
