# frozen_string_literal: true

module Api
  module V1
    module Invoices
      class MerchantsController < ApplicationController
        def show
          render json: MerchantSerializer.new(Merchant.merchant_by_invoice(params[:invoice_id]))
        end
      end
    end
  end
end
