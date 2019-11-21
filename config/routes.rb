Rails.application.routes.draw do
  resources :pages

  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  resources :categories, only: %i[index show]
  resources :products, only: %i[index show] do
    collection do
      get 'search_results'
    end
  end
  resources :orders, only: %i[index show]
  resources :order_details: only: %i[index show]
  post 'products/add_to_cart/:id', to: 'products#add_to_cart'

  root 'products#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end