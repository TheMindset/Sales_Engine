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

  enum status: ["shipped", "pending"]

  def self.get_invoice_of_transaction(transaction_id)
    joins(:transactions).where(transactions: { id: transaction_id })
  end
end
