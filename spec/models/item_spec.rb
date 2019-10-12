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
  it "has a valid factory" do
    expect(build(:item)).to be_valid
  end

  describe "Associations" do
    let(:item) { build(:item) }

    it { is_expected.to belong_to(:merchant) }
  end
end
