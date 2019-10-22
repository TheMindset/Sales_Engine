# frozen_string_literal: true

module Api
  module V1
    module Merchants
      class PendingInvoicesController < ApplicationController
        def show
          customers = Merchant.customers_with_pending_invoices(params[:id])
          render json: CustomerSerializer.new(customers)
        end
      end
    end
  end
end
