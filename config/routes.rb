Rails.application.routes.draw do
  get '' => 'pages#home'
  get '/edit' => 'users#edit'
  post '/edit' => 'users#update'
  get '/show' => 'users#show'
  get '/favorite_recipe' => 'users#favorite_recipe'
  get '/my_favorites' => 'users#my_favorites'
  get '/favorited_recipes' => 'users#favorited_recipes'
  get '/grocery_list' => 'users#grocery_list'

  devise_for :users, :controllers => {:registrations => "registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


end
