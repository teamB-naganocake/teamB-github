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
    get 'top', to: "homes#top"#, as: "top"
    get 'about', to: "homes#about", as: "about"
    resources :orders_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :public do
    get 'top', to: "homes#top"#, as: "top"
    get 'about', to: "homes#about", as: "about"

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    resources :items, only: [:show, :index, :edit, :create, :update, :destroy]

    get 'orders/thanks', to: "orders#thanks"
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm', to: "orders#confirm"

    resources :cart_items,only: [:index,:create,:update,:destroy] do
      collection do
        delete "all_destroy"   #パスが　all_destroy_cart_items_path, method: :delete　となる
      end
    end

    get "customers/mypage", to: "customers#show"
    get "customers/information/edit", to: "customers#edit"
    patch "customers/information", to: "customers#update"
    get 'customers/unsubscribe', to: "customers#unsubscribe"
    patch 'customers/withdraw', to: "customers#withdraw"
    
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "search" => "searches#search"

end