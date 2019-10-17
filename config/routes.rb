Rails.application.routes.draw do
  resources :students
  resources :teachers
  resources :courses
  get '/signup' => 'teachers#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
