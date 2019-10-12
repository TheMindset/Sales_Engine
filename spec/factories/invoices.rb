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

FactoryBot.define do
  factory :invoice do
  end
end
