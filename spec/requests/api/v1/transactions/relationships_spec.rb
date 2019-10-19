# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transaction relationships API', type: :request do
  it "can get the invoice related to transactions" do
    invoice = create(:invoice)

    transaction = create(:transaction, invoice_id: invoice.id )

    get "/api/v1/transactions/#{transaction.id}/invoice"
    expect(response).to be_successful

    display = JSON.parse(response.body)
    expect(display["data"][0]["id"].to_i).to eq(invoice.id)
  end
end
