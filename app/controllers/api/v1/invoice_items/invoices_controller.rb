# frozen_string_literal: true

module Api
  module V1
    module InvoiceItems
      class InvoicesController < ApplicationController
        def show
          render json: InvoiceItemSerializer.new(InvoiceItem.find(params[:invoice_item_id]))
        end
      end
    end
  end
end
