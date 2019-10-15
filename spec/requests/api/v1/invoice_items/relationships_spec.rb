# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'InvoiceItem relationships API', type: :request do
  it "can get the item belongs to the invoice_items" do
    item = create(:item)
    order = create(:invoice_item)
    order.update(item_id: item.id)

    get "/api/v1/invoice_items/#{order.id}/item"
    expect(response).to be_successful

    display = JSON.parse(response.body)
    expect(display["data"]["attributes"]["item_id"]).to eq(item.id)
  end

  it "can get the invoice belongs to the invoice_items" do
    invoice = create(:invoice)
    order = create(:invoice_item)
    order.update(invoice_id: invoice.id)

    get "/api/v1/invoice_items/#{order.id}/invoice"
    expect(response).to be_successful

    display = JSON.parse(response.body)
    expect(display["data"]["attributes"]["invoice_id"]).to eq(invoice.id)
  end
end
