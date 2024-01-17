Rails.application.routes.draw do
  # 管理者用 URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用 URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :users

  namespace :admin do
    get 'homes/top'
    get 'homes/about'
    resources :orders_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resources :items, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
      get 'orders/confirm'
      get 'orders/thanks'
    resources :cart_items, only: [:index, :update, :destroy, :create]
      get 'cart_items/destroy_all'
    resources :customers, only: [:show, :edit, :update]
      get 'customers/unsubscribe'
      get 'customers/withdraw'
    resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
