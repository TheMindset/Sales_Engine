# frozen_string_literal: true

module Api
  module V1
    module Items
      class ItemSalesController < ApplicationController
        def show
          items = Item.date_of_highset_sales(params[:id])
          render json: DateSerializer.new(items)
        end
      end
    end
  end
end
