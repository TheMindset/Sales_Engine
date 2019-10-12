# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
  has_many :invoices
end