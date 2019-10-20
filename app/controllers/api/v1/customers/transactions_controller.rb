# frozen_string_literal: true

module Api
  module V1
    module Customers
      class TransactionsController < ApplicationController
        def index
          render json: TransactionSerializer.new(Transaction.get_all_transactions_for_customer(params[:customer_id]))
        end
      end
    end
  end
end
