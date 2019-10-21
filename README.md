# README

# Sales Engine

## Introduction:

This is a project on learning how to build an API. 
Rails Engine Project Spec Requirements: [here](http://backend.turing.io/module3/projects/rails_engine)

## Stack techniques: 
- **Ruby 2.6.2 & Rails 5.2.3**
- **Clean code: => Rubocop**
- **Test: Rspec**
- **Clean commit => Husky { Rubocop, Rspec}**

## Get Started :

  * Install gem with `rails bundle install`
  * Setup the database with `rails db:create db:migrate`
  * Run task with `rails import_csv:all_data`
  * Visit endpoints launch local server with `rails server`


### Record Endpoints

#### Merchants

- **<code>GET</code> /api/v1/merchants**
- **<code>GET</code> /api/v1/merchants/:id**
- **<code>GET</code> /api/v1/merchants/random**

#### Customers
- **<code>GET</code> /api/v1/customers**
- **<code>GET</code> /api/v1/customers/:id**
- **<code>GET</code> /api/v1/customers/random**

#### Items
- **<code>GET</code> /api/v1/items**
- **<code>GET</code> /api/v1/items/:id**
- **<code>GET</code> /api/v1/items/random**

#### Invoices
- **<code>GET</code> /api/v1/invoices**
- **<code>GET</code> /api/v1/invoices/:id**
- **<code>GET</code> /api/v1/invoices/random**

#### Invoice_Items
- **<code>GET</code> /api/v1/invoice_items**
- **<code>GET</code> /api/v1/invoice_items/:id**
- **<code>GET</code> /api/v1/invoice_items/random**

#### Transactions
- **<code>GET</code> /api/v1/transactions**
- **<code>GET</code> /api/v1/transactions/:id**
- **<code>GET</code> /api/v1/transactions/random**

### Relationship Endpoints

#### Merchants

- **<code>GET</code> /api/v1/merchants/:id/items** returns a collection of items associated with that merchant.
- **<code>GET</code> /api/v1/merchants/:id/invoices** returns a collection of invoices associated with that merchant from their known orders.

#### Invoices

- **<code>GET</code> /api/v1/invoices/:id/transactions** returns a collection of associated transactions.
- **<code>GET</code> /api/v1/invoices/:id/invoice_items** returns a collection of associated invoice items.
- **<code>GET</code> /api/v1/invoices/:id/items** returns a collection of associated items.
- **<code>GET</code> /api/v1/invoices/:id/customer** returns the associated customer.
- **<code>GET</code> /api/v1/invoices/:id/merchant** returns the associated merchant.

#### Invoice Items

- **<code>GET</code> /api/v1/invoice_items/:id/invoice** returns the associated invoice.
- **<code>GET</code> /api/v1/invoice_items/:id/item** returns the associated item.

#### Items

- **<code>GET</code> /api/v1/items/:id/invoice_items** returns a collection of associated invoice items.
- **<code>GET</code> /api/v1/items/:id/merchant** returns the associated merchant.
#### Transactions

- **<code>GET</code> /api/v1/transactions/:id/invoice** returns the associated invoice.

#### Customers

- **<code>GET</code> /api/v1/customers/:id/invoices** returns a collection of associated invoices.
- **<code>GET</code> /api/v1/customers/:id/transactions** returns a collection of associated transactions.

### Business Intelligence Endpoints

#### Merchants

- **<code>GET</code> /api/v1/merchants/most_revenue?quantity=x** returns the top x merchants ranked by total revenue.
- **<code>GET</code> /api/v1/merchants/most_items?quantity=x** returns the top x merchants ranked by total number of items sold.
- **<code>GET</code> /api/v1/merchants/revenue?date=x** returns the total revenue for date x across all merchants
- **<code>GET</code>  /api/v1/merchants/:id/revenue?date=x** returns the total revenue for that merchant for a specific invoice date x.
- **<code>GET</code>  /api/v1/merchants/:id/favorite_customer** returns the customer who has conducted the most total number of successful transactions.

#### Items

- **<code>GET</code> /api/v1/items/most_items?quantity=x** returns the top x item instances ranked by total number sold.
- **<code>GET</code> /api/v1/items/:id/best_day** returns the date with the most sales for the given item using the invoice_date.

#### Customers

- **<code>GET</code> /api/v1/customers/:id/favorite_merchant** returns a merchant where the customer has conducted the most successful transactions.