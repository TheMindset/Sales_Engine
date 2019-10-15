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

  def self.merchant_by_invoice(invoice_id)
    joins(:invoices).where(invoices: { id: invoice_id })
  end
end
