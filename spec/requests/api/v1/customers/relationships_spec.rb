# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customer relationships API', type: :request do
  it "can get all invoices belongs to a customer" do
    customer = create(:customer)
    create_list(:invoice, 3, customer_id: customer.id)

    get "/api/v1/customers/#{customer.id}/invoices"
    expect(response).to be_successful

    display = JSON.parse(response.body)
    expect(display["data"].count).to eq(3)
  end

  it "can get all transactions belongs to a customer" do
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id)
    create_list(:transaction, 3, invoice_id: invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"
    expect(response).to be_successful

    display = JSON.parse(response.body)
    expect(display["data"].count).to eq(3)
  end
end
