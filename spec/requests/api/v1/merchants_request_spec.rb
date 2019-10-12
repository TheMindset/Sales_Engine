# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Merchants API', type: :request do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'
    expect(response).to be_successful

    merchant = JSON.parse(response.body)
    expect(merchant["data"].count).to eq(3)
  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)
    expect(response).to be_successful

    expect(merchant["data"]["id"].to_i).to eq(id)
  end

  it "can get all items belongs to a merchant" do
    id = create(:merchant).id
    create_list(:item, 3, merchant_id: id)

    get "/api/v1/merchants/#{id}/items"
    expect(response).to be_successful

    merchant_items = JSON.parse(response.body)

    expect(merchant_items["data"].count).to eq(3)
  end
end
