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

FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { " The best items never see in the world" }
    unit_price { rand(1000..2457) }
    merchant { FactoryBot.create(:merchant) }
  end
end
