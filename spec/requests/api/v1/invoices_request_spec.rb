# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Invoice API', type: :request do
  it "sends a list of invoices" do
    create_list(:invoice, 3)

    get '/api/v1/invoices'
    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"].count).to eq(3)
  end

  it "can get one invoice by its id" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)
    expect(response).to be_successful

    expect(invoice["data"]["id"].to_i).to eq(id)
  end
end
