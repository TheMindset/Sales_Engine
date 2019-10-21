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

class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :merchant_id

  attribute :unit_price do |obj|
    (obj.unit_price.to_f / 100).round(2)
  end
end
