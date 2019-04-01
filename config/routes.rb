Rails.application.routes.draw do
  get '' => 'recipes#index'
  get '/signup' => 'recipes#signup'
  get '/index' => 'recipes#index'
  post '/index' => 'recipes#index'
  post '/edit' => 'recipes#edit'


end
