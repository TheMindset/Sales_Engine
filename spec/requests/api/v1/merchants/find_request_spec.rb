# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'find feature', type: :request do
  it "find a merchants by any associated attributes" do
    create_list(:merchant, 2)
    third_merchant = create(:merchant, name: 'Willy')

    get '/api/v1/merchants/find?name=Willy'
    expect(response).to be_successful

    merchant = JSON.parse(response.body)
    expect(merchant["data"]["attributes"]["name"]).to eq(third_merchant.name)
  end

  it "find all marchants by associated attributes" do
    create_list(:merchant, 2)
    create(:merchant, name: "Baltazar")
    create(:merchant, name: "Baltazar")

    get "/api/v1/merchants/find_all?name=Baltazar"

    merchants_by_name = JSON.parse(response.body)
    expect(response).to be_successful

    expect(merchants_by_name["data"].count).to eq(2)
  end
end
