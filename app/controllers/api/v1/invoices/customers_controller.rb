# frozen_string_literal: true

module Api
  module V1
    module Invoices
      class CustomersController < ApplicationController
        def show
          render json: CustomerSerializer.new(Customer.customer_by_invoice(params[:invoice_id]))
        end
      end
    end
  end
end
