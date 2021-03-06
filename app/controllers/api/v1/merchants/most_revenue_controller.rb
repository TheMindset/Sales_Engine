# frozen_string_literal: true

module Api
  module V1
    module Merchants
      class MostRevenueController < ApplicationController
        def index
          merchants = Merchant.most_revenue(params[:quantity])
          render json: MerchantSerializer.new(merchants)
        end
      end
    end
  end
end
