Rails.application.routes.draw do

  devise_for :costomers

  get '/home/top' => 'public/homes#top'
  get '/home/about' => 'public/homes#about'

  get '/items' => 'items#index'
  get '/items/:id' => 'items/show'

  get '/admin/customers' => 'admin/customers#index'
  get '/admin.customers/:id' => 'admin/customers#show'
  get '/admin/customers/:id/edit' => 'admin/customers#edit'
  patch '/admin/customers/:id' => 'admin/customers/update'


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
