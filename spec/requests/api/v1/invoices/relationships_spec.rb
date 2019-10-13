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

  it "can get all invoice_items belongs to an invoice" do
    id = create(:invoice).id
    create_list(:invoice_item, 3, invoice_id: id)

    get "/api/v1/invoices/#{id}/invoice_items"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items["data"].count).to eq(3)
  end

  it "can get all items belongs to an invoice" do
    invoice = create(:invoice)
    item1, item2 = create_list(:item, 2)
    create(:invoice_item, invoice: invoice, item: item1)
    create(:invoice_item, invoice: invoice, item: item2)

    get "/api/v1/invoices/#{invoice.id}/items"
    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(2)
  end
end
