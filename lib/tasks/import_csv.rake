# frozen_string_literal: true

require 'csv'

namespace :import_csv do
  desc "Import data from merchants.csv"

  task merchant_data: :environment do
    merchant_csv = "db/csv/merchants.csv"

    merchants = []
    CSV.foreach(merchant_csv, headers: true) do |row|
      merchants << row.to_hash
    end

    Merchant.create(merchants)
    p "Merchants data imported"
  end
end
