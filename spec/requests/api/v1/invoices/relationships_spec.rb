# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Invoice relationships API', type: :request do
  it "can get all transactions belongs to an invoice" do
    id = create(:invoice).id
    create_list(:transaction, 3, invoice_id: id)

    get "/api/v1/invoices/#{id}/transactions"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions["data"].count).to eq(3)
  end
end
