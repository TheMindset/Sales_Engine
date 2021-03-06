# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Invoice relationships API', type: :request do
  it "can get all transactions belongs to an invoice" do
    id = create(:invoice).id
    create_list(:transaction, 3, invoice_id: id)

    get "/api/v1/invoices/#{id}/transactions"
    expect(response).to be_successful

    display = JSON.parse(response.body)

    expect(display["data"].count).to eq(3)
  end

  it "can get all invoice_items belongs to an invoice" do
    id = create(:invoice).id
    create_list(:invoice_item, 3, invoice_id: id)

    get "/api/v1/invoices/#{id}/invoice_items"
    expect(response).to be_successful

    display = JSON.parse(response.body)

    expect(display["data"].count).to eq(3)
  end

  it "can get all items belongs to an invoice" do
    invoice = create(:invoice)
    item1, item2 = create_list(:item, 2)
    create(:invoice_item, invoice: invoice, item: item1)
    create(:invoice_item, invoice: invoice, item: item2)

    get "/api/v1/invoices/#{invoice.id}/items"
    expect(response).to be_successful

    display = JSON.parse(response.body)
    expect(display["data"].count).to eq(2)
  end

  it "can get the customer belongs to an invoice" do
    customer = create(:customer)
    invoice1 = create(:invoice, customer_id: customer.id)

    get "/api/v1/invoices/#{invoice1.id}/customer"

    expect(response).to be_successful
    display = JSON.parse(response.body)
    expect(display["data"][0]["attributes"]["id"]).to eq(customer.id)
  end

  it "can get the merchant belongs to an invoice" do
    merchant = create(:merchant)
    invoice1 = create(:invoice, merchant_id: merchant.id)

    get "/api/v1/invoices/#{invoice1.id}/merchant"

    expect(response).to be_successful
    display = JSON.parse(response.body)
    expect(display["data"][0]["attributes"]["id"]).to eq(merchant.id)
  end
end
