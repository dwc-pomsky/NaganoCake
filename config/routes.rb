Rails.application.routes.draw do


  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get 'admin' => 'admin/homes#top'

  get '/items' => 'public/items#index'

  get '/items/:id' => 'public/items#show'

  #get '/admin/customers' => 'admin/customers#index'
  #get '/admin/customers/:id' => 'admin/customers#show'
  #get '/admin/customers/:id/edit' => 'admin/customers#edit'
  #patch '/admin/customers/:id' => 'admin/customers#update'

  namespace :admin do
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_items, only: [:update]
    resources :order, only:[:show, :update]
  end


  devise_for :customers,skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  devise_scope :customer do
    get '/customers', to: 'public/registrations#new'
  end
  get 'customers/mypage' => 'public/customers#show'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  resources :delivery_addresses, module: :public, :except => [:new, :show]
  resources :cart_items, module: :public, :except => [:new, :show, :edit] do
    collection do
      delete 'destroy_all'
    end
  end

  resources :orders, module: :public, :only => [:new,:create,:index,:show] do
    collection do
      post 'confirm'
      get 'complete'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
