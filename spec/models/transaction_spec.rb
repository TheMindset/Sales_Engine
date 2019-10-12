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

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
