Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "/home/about", to: "homes#about"

  resources :items, only: [:show, :index]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :customers, only: [:show, :edit, :update] do
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end

  resources :cart_items, only: [:index, :update, :destroy, :create] do
    get 'cart_items/destroy_all'
  end

  resources :orders, only: [:new, :index, :show] do
    get 'orders/confirm'
    get 'orders/thanks'
  end

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  # 管理者側
  resources :genres, only: [:index, :create, :edit, :update]
  get 'order_details/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
