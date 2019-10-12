# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Merchants relationships API', type: :request do
  it "can get all items belongs to a merchant" do
    id = create(:merchant).id
    create_list(:item, 3, merchant_id: id)

    get "/api/v1/merchants/#{id}/items"
    expect(response).to be_successful

    merchant_items = JSON.parse(response.body)

    expect(merchant_items["data"].count).to eq(3)
  end

  it "can get all invoices belongs to a merchant" do
    id = create(:merchant).id
    create_list(:invoice, 3, merchant_id: id)

    get "/api/v1/merchants/#{id}/invoices"
    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices["data"].count).to eq(3)
  end
end
