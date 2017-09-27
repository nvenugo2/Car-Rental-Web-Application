Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/cars' => 'cars#index'
  get '/carsforapproval' => 'cars#carsforapproval'
  get'/cars/:id' => 'cars#show', as: :car
  get '/car/new' => 'cars#new', as: :new_car
  post '/cars' => 'cars#create'
  get '/cars/:id/edit' => 'cars#edit', as: :edit_car
  patch '/cars/:id' => 'cars#update'
  delete '/cars/:id' => 'cars#destroy'

  resources :users, :except => [:new, :create, :edit, :update, :show, :destroy] do
    get :makeadmin, on: :member
    get :makesuperadmin, on: :member
  end

  get '/signup' => 'users#new', as: :new_user
  post '/users' => 'users#create'
  get '/indexcustomers' => 'users#indexcustomers'
  get '/indexadmin' => 'users#indexadmin'
  get '/indexsuperadmin' => 'users#indexsuperadmin'
  get '/users/:id/edit' => 'users#edit', as: :edit_user
  patch '/users/:id' => 'users#update'
  get '/users/:id' => 'users#show', as: :user
  get '/admin' => 'users#admin'
  get '/customer' => 'users#customer'
  get '/superadmin' => 'users#superadmin'
  delete '/users/:id' => 'users#destroy'





  get '/login' => 'sessions#new', as: :new_session
  post  '/sessions' => 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :logout
  get '/set_session' => 'sessions#set_session'

  resources :reservations, :except => [:new, :create, :edit, :update, :show, :destroy] do
    get :checkout, on: :member
    get :checkin, on: :member
  end

  get '/reservation/new' => 'reservations#new', as: :new_reservation
  post '/reservations' => 'reservations#create'
  get '/reservationlog' => 'reservations#reservationlog'
  get '/currentreservations' => 'reservations#currentreservations'

  root 'sessions#new'
end
