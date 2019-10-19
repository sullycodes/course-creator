Rails.application.routes.draw do
  get '/' => 'welcome#home'
  resources :teachers, except: [:index] do
    resources :students
  end
  resources :courses
  get '/signup' => 'teachers#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/students/:id/enroll' => 'students#enroll', as: 'enroll'
  post '/students/:id/enroll' => 'students#create_enrollment'
  get '/students/:id/unenroll' => 'students#unenroll', as: 'unenroll'
end
