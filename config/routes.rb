Rails.application.routes.draw do
  get '' => 'pages#home'
  get '/signup' => 'recipes#signup'
  get '/index' => 'recipes#index'
  post '/index' => 'recipes#index'
  post '/edit' => 'recipes#edit'



  devise_for :users, :controllers => {:registrations => "registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


end
