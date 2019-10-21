# frozen_string_literal: true

module Api
  module V1
    module Items
      class MostRevenueController < ApplicationController
        def index
          items = Item.most_revenue(params[:quantity])
          render json: ItemSerializer.new(items)
        end
      end
    end
  end
end
