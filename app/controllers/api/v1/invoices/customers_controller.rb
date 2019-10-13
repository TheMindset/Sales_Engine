# frozen_string_literal: true

module Api
  module V1
    module Invoices
      class CustomersController < ApplicationController
        def index
          render json: CustomerSerializer.new(Invoice.find(params[:invoice_id]).customer)
        end
      end
    end
  end
end
