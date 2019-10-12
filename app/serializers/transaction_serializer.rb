# frozen_string_literal: true

class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :credit_card_number, :result

  belongs_to :invoice
end
