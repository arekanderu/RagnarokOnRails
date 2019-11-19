Rails.application.routes.draw do

  get 'orders/show'
  get 'order_details/cart'
  resources :categories, only: %i[index show]
  resources :products, only: %i[index show] do
    collection do
      get 'search_results'
    end
  end

  root 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end