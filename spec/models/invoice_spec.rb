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

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
