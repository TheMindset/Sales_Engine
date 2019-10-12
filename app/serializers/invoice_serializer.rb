# frozen_string_literal: true

class InvoiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :status, :customer_id, :merchant_id

  belongs_to :customer
  belongs_to :merchant
end
