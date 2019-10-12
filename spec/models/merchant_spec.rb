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

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "has a valid factory" do
    expect(build(:merchant)).to be_valid
  end

  describe "Associations" do
    let(:merchant) { build(:merchant) }

    it { is_expected.to have_many(:items) }
  end
end
