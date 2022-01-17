Rails.application.routes.draw do

  devise_for :costomers

  get '/home/top' => 'public/homes#top'
  get '/home/about' => 'public/homes#about'

  get '/items' => 'items#index'
  get '/items/:id' => 'items/show'


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
