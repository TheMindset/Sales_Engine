# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'InvoiceItem relationships API', type: :request do
  it "can get all invoice_items belongs to an item" do
    id = create(:item).id
    create_list(:invoice_item, 3, item_id: id)

    get "/api/v1/items/#{id}/invoice_items"
    expect(response).to be_successful

    display = JSON.parse(response.body)
    expect(display["data"].count).to eq(3)
  end

  it "can get the merchant belongs to an item" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}/merchant"
    expect(response).to be_successful
    display = JSON.parse(response.body)
    expect(display["name"]).to eq(merchant.name)
  end
end
