# frozen_string_literal: true

module Api
  module V1
    module Items
      class InvoiceItemsController < ApplicationController
        def index
          render json: InvoiceItemSerializer.new(InvoiceItem.find_all_invoices_for_item(params[:item_id]))
        end
      end
    end
  end
end
