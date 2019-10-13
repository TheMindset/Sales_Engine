# frozen_string_literal: true

module Api
  module V1
    module Invoices
      class InvoiceItemsController < ApplicationController
        def index
          render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_id: params[:invoice_id]))
        end
      end
    end
  end
end
