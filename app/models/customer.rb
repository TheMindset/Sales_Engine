# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  def self.customer_by_invoice(invoice_id)
    joins(:invoices).where(invoices: { id: invoice_id })
  end
end
