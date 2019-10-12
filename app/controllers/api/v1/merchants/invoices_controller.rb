# frozen_string_literal: true

module Api
  module V1
    module Merchants
      class InvoicesController < ApplicationController
        def index
          render json: InvoiceSerializer.new(Invoice.where(merchant_id: params[:merchant_id]))
        end
      end
    end
  end
end
