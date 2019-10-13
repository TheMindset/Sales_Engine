# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Invoice_items API', type: :request do
  it "sends a list of invoice_items" do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"].count).to eq(3)
  end

  it "can get one invoice_item by its id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)
    expect(response).to be_successful

    expect(invoice_item["data"]["id"].to_i).to eq(id)
  end
end
