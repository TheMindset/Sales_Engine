# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe 'business intelligence', type: :request do
  let!(:merchant1) { create(:merchant) }
  let!(:merchant3) { create(:merchant) }
  let!(:merchant2) { create(:merchant) }
  let!(:merchant4) { create(:merchant) }

  let!(:customer1) { create(:customer) }
  let!(:customer3) { create(:customer) }
  let!(:customer2) { create(:customer) }
  let!(:customer4) { create(:customer) }

  let!(:invoice1) { create(:invoice, merchant_id: merchant1.id, customer_id: customer2.id) }
  let!(:invoice3) { create(:invoice, merchant_id: merchant3.id, customer_id: customer2.id) }
  let!(:invoice4) { create(:invoice, merchant_id: merchant2.id, customer_id: customer1.id) }
  let!(:invoice5) { create(:invoice, merchant_id: merchant1.id, customer_id: customer2.id) }
  let!(:invoice6) { create(:invoice, merchant_id: merchant4.id, customer_id: customer4.id) }
  let!(:invoice7) { create(:invoice, merchant_id: merchant4.id, customer_id: customer3.id) }
  let!(:invoice8) { create(:invoice, merchant_id: merchant4.id, customer_id: customer3.id) }

  let!(:transactions1) { create(:transaction, result: 0, invoice_id: invoice1.id) }
  let!(:transactions2) { create(:transaction, result: 0, invoice_id: invoice3.id) }
  let!(:transactions3) { create(:transaction, result: 0, invoice_id: invoice6.id) }
  let!(:transactions4) { create(:transaction, result: 0, invoice_id: invoice4.id) }
  let!(:transactions5) { create(:transaction, result: 0, invoice_id: invoice5.id) }

  it 'get the favorite merchant' do
    get "/api/v1/customers/#{customer2.id}/favorite_merchant"

    display = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(display[0]["id"].to_i).to eq(merchant1.id)
  end
end
