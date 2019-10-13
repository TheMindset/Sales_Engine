# frozen_string_literal: true

module Api
  module V1
    module Invoices
      class ItemsController < ApplicationController
        def index
          render json: ItemSerializer.new(Item.items_by_invoice(params[:invoice_id]))
        end
      end
    end
  end
end
