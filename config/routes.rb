Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  get 'customers/mypage' => 'public/customers#show'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
