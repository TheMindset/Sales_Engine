# frozen_string_literal: true

Rails.application.routes.draw do
  root 'api/v1/merchants#index'
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get 'find_all', to: 'find#index'
        get 'find', to: 'find#show'
      end

      resources :merchants, only: [:index, :show] do
        scope module: :merchants do
          resources :items, only: [:index]
          resources :invoices, only: [:index]
        end
      end

      resources :items, only: [:index, :show] do
        scope module: :items do
          resources :invoice_items, only: [:index]
          resource :merchant, only: [:show]
        end
      end

      resources :invoices, only: [:index, :show] do
        scope module: :invoices do
          resources :transactions, only: [:index]
          resources :invoice_items, only: [:index]
          resources :items, only: [:index]
          resource :customer, only: [:show]
          resource :merchant, only: [:show]
        end
      end

      resources :transactions, only: [:index, :show] do
        scope module: :transactions do
          resource :invoice, only: [:show]
        end
      end

      resources :invoice_items, only: [:index, :show] do
        scope module: :invoice_items do
          resource :invoice, only: [:show]
          resource :item, only: [:show]
        end
      end

      resources :customers, only: [:index, :show]
    end
  end
end
