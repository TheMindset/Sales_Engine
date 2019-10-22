# frozen_string_literal: true

module Api
  module V1
    module Customers
      class FavoriteMerchantController < ApplicationController
        def show
          merchant = Merchant.get_the_favorite_merchant(params[:id])
          render json: MerchantSerializer.new(merchant)
        end
      end
    end
  end
end
