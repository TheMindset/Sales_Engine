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

class MerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
