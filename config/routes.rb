Rails.application.routes.draw do


  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get 'admin' => 'admin/homes#top'

# ↓下記でscope items resourcesの記述を追加したため不要と思いコメントアウトしました。不要と確定すれば消去します。

  # get '/items' => 'items#index'
  # get '/items/:id' => 'items#show'
  
  resources :items, only: [:index,:show]

# ↓namespac admin resourcesで下記に書いているため不要と思いコメントアウトしました。不要と確定すれば消去します。

  get '/admin/customers' => 'admin/customers#index'
  get '/admin/customers/:id' => 'admin/customers#show'
  get '/admin/customers/:id/edit' => 'admin/customers#edit'
  patch '/admin/customers/:id' => 'admin/customers#update'

  namespace :admin do
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
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
  resources :cart_items, module: :public, :except => [:new, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
