# frozen_string_literal: true

Rails.application.routes.draw do
  root 'api/v1/merchants#index'
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
    end
  end
end
