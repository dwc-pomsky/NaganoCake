Rails.application.routes.draw do
  devise_for :costomers
  devise_for :admin, skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  get 'admin' => 'admin/homes#top'

  namespace :admin do
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
