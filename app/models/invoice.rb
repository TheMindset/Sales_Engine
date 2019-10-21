# frozen_string_literal: true

# == Schema Information
#
# Table name: invoices
#
#  id          :bigint           not null, primary key
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint
#  merchant_id :bigint
#
# Indexes
#
#  index_invoices_on_customer_id  (customer_id)
#  index_invoices_on_merchant_id  (merchant_id)
#

class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :select_date, ->(date) { where(created_at: date) }

  def self.get_invoice_of_transaction(transaction_id)
    joins(:transactions).where(transactions: { id: transaction_id })
  end

  def self.get_all_invoices_fo_customer(customer_id)
    joins(:customer).where(customers: { id: customer_id })
  end

  # def self.most_revenue(limit = 5, sorting = "DESC")
  #   select("invoices.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue")
  #   .joins(:invoice_items, :transactions)
  #   .merge(Transiction.successful) # scope in Transaction model
  #   .group(:id)
  #   .order("revenue #{sorting}")
  #   .limit(limit)
  # end
end
