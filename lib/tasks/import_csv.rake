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

  task customers_data: :environment do
    customer_csv = "db/csv/customers.csv"

    customers = []
    CSV.foreach(customer_csv, headers: true) do |row|
      customers << row.to_hash
    end

    Customer.create(customers)
    p "Customers data imported"
  end

  task invoices_data: :environment do
    invoice_csv = "db/csv/invoices.csv"

    invoices = []
    CSV.foreach(invoice_csv, headers: true) do |row|
      invoices << row.to_hash
    end

    Invoice.create(invoices)
    p "Invoices data imported"
  end

  task invoice_items_data: :environment do
    invoice_item_csv = "db/csv/invoice_items.csv"

    invoice_items = []
    CSV.foreach(invoice_item_csv, headers: true) do |row|
      invoice_items << row.to_hash
    end

    InvoiceItem.create(invoice_items)
    p "Invoice_items data imported"
  end

  task transactions_data: :environment do
    transaction_csv = "db/csv/transactions.csv"

    transactions = []
    CSV.foreach(transaction_csv, headers: true) do |row|
      transactions << row.to_hash
    end

    Transaction.create(transactions)
    p "Transactions data imported"
  end
end
