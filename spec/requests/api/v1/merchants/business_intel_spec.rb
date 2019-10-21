# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'business intelligence', type: :request do
  let!(:merchant1) { create(:merchant) }
  let!(:merchant3) { create(:merchant) }
  let!(:merchant2) { create(:merchant) }
  let!(:merchant4) { create(:merchant) }

  let!(:invoice1) { create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-25 09:54:09 UTC") }
  let!(:invoice2) { create(:invoice, merchant_id: merchant2.id) }
  let!(:invoice3) { create(:invoice, merchant_id: merchant1.id) }
  let!(:invoice4) { create(:invoice, merchant_id: merchant3.id) }
  let!(:invoice5) { create(:invoice, merchant_id: merchant4.id, created_at: "2012-03-25 09:54:09 UTC") }

  let!(:invoice_items1) { create(:invoice_item, invoice_id: invoice1.id) }
  let!(:invoice_items2) { create(:invoice_item, invoice_id: invoice3.id) }
  let!(:invoice_items3) { create(:invoice_item, invoice_id: invoice2.id) }
  let!(:invoice_items4) { create(:invoice_item, invoice_id: invoice4.id) }
  let!(:invoice_items5) { create(:invoice_item, invoice_id: invoice5.id) }

  let!(:transactions1) { create(:transaction, result: "success", invoice_id: invoice1.id) }
  let!(:transactions2) { create(:transaction, result: "success", invoice_id: invoice3.id) }
  let!(:transactions3) { create(:transaction, result: "success", invoice_id: invoice2.id) }
  let!(:transactions4) { create(:transaction, result: "success", invoice_id: invoice4.id) }
  let!(:transactions5) { create(:transaction, result: "success", invoice_id: invoice5.id) }

  it 'get the top x merchant by mot revenue' do
    get "/api/v1/merchants/most_revenue?quantity=3"

    display = JSON.parse(response.body)["data"]

    expect(response).to be_successful

    expect(display.length).to eq(3)
    expect(display[0]["id"].to_i).to eq(merchant1.id)
  end

  it 'get total revenue for x day' do
    get "/api/v1/merchants/revenue?date=#{invoice5.created_at}"

    display = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(display.count).to eq(2)
  end
end
