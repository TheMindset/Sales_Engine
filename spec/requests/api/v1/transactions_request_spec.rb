# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'Transactions API', type: :request do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transaction = JSON.parse(response.body)
    expect(transaction["data"].count).to eq(3)
  end

  it "can get one transaction by its id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["data"]["id"].to_i).to eq(id)
  end
end
