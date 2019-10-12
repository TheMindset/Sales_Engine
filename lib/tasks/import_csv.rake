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

  task items_data: :environment do
    item_csv = "db/csv/items.csv"

    items = []
    CSV.foreach(item_csv, headers: true) do |row|
      items << row.to_hash
    end

    Item.create(items)
    p "Items data imported"
  end
end
