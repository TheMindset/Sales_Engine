# frozen_string_literal: true

module Api
  module V1
    module Merchants
      class RevenueController < ApplicationController
        def index
          merchants = Merchant.date_revenue(params[:date])
          render json: MerchantSerializer.new(merchants)
        end
      end
    end
  end
end
