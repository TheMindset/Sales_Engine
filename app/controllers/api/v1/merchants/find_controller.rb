# frozen_string_literal: true

module Api
  module V1
    module Merchants
      class FindController < ApplicationController
        def index
          merchants = Merchant.where(merchant_params)
          render json: MerchantSerializer.new(merchants)
        end

        def show
          merchant = Merchant.find_by(merchant_params)
          render json: MerchantSerializer.new(merchant)
        end

        private

        def merchant_params
          params.permit(:id, :name, :updated_at, :created_at)
        end
      end
    end
  end
end
