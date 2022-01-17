Rails.application.routes.draw do

  devise_for :costomers

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
