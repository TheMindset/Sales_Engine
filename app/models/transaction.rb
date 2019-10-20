# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id                          :bigint           not null, primary key
#  credit_card_expiration_date :text
#  credit_card_number          :bigint
#  result                      :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  invoice_id                  :bigint
#
# Indexes
#
#  index_transactions_on_invoice_id  (invoice_id)
#

class Transaction < ApplicationRecord
  belongs_to :invoice

  enum result: ["success", "failed"]

  def self.get_all_transactions_for_customer(customer_id)
    joins(:invoice).where(invoices: { customer_id: customer_id })
  end


end
