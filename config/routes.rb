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

      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
