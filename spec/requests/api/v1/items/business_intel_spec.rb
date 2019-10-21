# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'business intelligence', type: :request do
  let!(:item1) { create(:item) }
  let!(:item3) { create(:item) }
  let!(:item2) { create(:item, unit_price: 3000) }
  let!(:item4) { create(:item) }
  let!(:item5) { create(:item, unit_price: 2000) }

  let!(:invoice1) { create(:invoice, created_at: "2012-11-25 09:54:09 UTC") }
  let!(:invoice2) { create(:invoice, created_at: "2012-04-25 09:54:09 UTC") }
  let!(:invoice3) { create(:invoice, created_at: "2012-03-28 09:54:09 UTC") }
  let!(:invoice4) { create(:invoice, created_at: "2012-03-21 09:54:09 UTC") }
  let!(:invoice5) { create(:invoice, created_at: "2012-09-25 09:54:09 UTC") }

  let!(:invoice_items1) { create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id) }
  let!(:invoice_items2) { create(:invoice_item, invoice_id: invoice3.id, item_id: item3.id) }
  let!(:invoice_items3) { create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 12) }
  let!(:invoice_items4) { create(:invoice_item, invoice_id: invoice4.id, item_id: item2.id) }
  let!(:invoice_items5) { create(:invoice_item, invoice_id: invoice2.id, item_id: item2.id, quantity: 12) }
  let!(:invoice_items6) { create(:invoice_item, invoice_id: invoice2.id, item_id: item5.id, quantity: 14) }

  it 'get the top x item by mot revenue' do
    get "/api/v1/items/most_revenue?quantity=3"

    display = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(display.length).to eq(3)
    expect(display[0]["id"].to_i).to eq(item2.id)
  end

  it 'get the best day for an item' do
    get "/api/v1/items/#{item2.id}/best_day"

    display = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(display[0]["id"].to_i).to eq(item2.id)
  end
end
