# frozen_string_literal: true

module Api
  module V1
    module Invoices
      class TransactionsController < ApplicationController
        def index
          render json: TransactionSerializer.new(Transaction.where(invoice_id: params[:invoice_id]))
        end
      end
    end
  end
end
