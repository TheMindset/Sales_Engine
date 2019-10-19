# frozen_string_literal: true

module Api
  module V1
    module Customers
      class InvoicesController < ApplicationController
        def index
          render json: InvoiceSerializer.new(Invoice.get_all_invoices_fo_customer(params[:customer_id]))
        end
      end
    end
  end
end
