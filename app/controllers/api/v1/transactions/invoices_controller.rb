# frozen_string_literal: true

module Api
  module V1
    module Transactions
      class InvoicesController < ApplicationController
        def show
          render json: InvoiceSerializer.new(Invoice.get_invoice_of_transaction(params[:transaction_id]))
        end
      end
    end
  end
end
