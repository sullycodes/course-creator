Rails.application.routes.draw do
  
  resources :conferences
  resources :parents
  resources :teachers, except: [:index] do
    resources :students
  end
  resources :courses

  get '/' => 'welcome#home'
  get '/signup' => 'teachers#new'
  post '/signup' => 'teachers#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/students/:id/enroll' => 'students#enroll', as: 'enroll'
  post '/students/:id/enroll' => 'students#create_enrollment'
  get '/students/:id/unenroll' => 'students#unenroll', as: 'unenroll'
end
