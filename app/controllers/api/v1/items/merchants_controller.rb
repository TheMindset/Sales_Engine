# frozen_string_literal: true

module Api
  module V1
    module Items
      class MerchantsController < ApplicationController
        def show
          render json: Item.merchant_for_item(params[:item_id])
        end
      end
    end
  end
end
