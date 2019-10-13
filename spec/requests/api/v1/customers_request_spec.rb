# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Customer API', type: :request do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'
    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers["data"].count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)
    expect(response).to be_successful

    expect(customer["data"]["id"].to_i).to eq(id)
  end
end
