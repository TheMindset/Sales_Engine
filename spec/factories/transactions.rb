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

FactoryBot.define do
  factory :transaction do
    credit_card_number { 4_654_405_418_249_632 }
    credit_card_expiration_date {}
    result { ["success", "failed"].sample }
    invoice { FactoryBot.create(:invoice) }
  end
end
