# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  unit_price  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  merchant_id :bigint
#
# Indexes
#
#  index_items_on_merchant_id  (merchant_id)
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
