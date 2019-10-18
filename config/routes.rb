Rails.application.routes.draw do
  
  resources :teachers do
    resources :students
  end
  resources :courses
  get '/signup' => 'teachers#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
