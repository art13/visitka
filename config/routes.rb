Visitka::Application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' } ,:path=>'users/registrations'
  devise_for :users 
  devise_scope :user do
      get '/login'=> 'users/sessions#new', :as => :login
      post '/login'=> 'users/sessions#create'
      get '/signup'=> 'users/registrations#new', :as => :signup
      get  '/users/passwords'=> 'users/passwords#new'
      post  '/users/passwords'=> 'users/passwords#create'
      put  '/users/passwords'=> 'users/passwords#update'
      match '/account'=>'users#account'
      #get '/login' => 'devise/sessions#new', :as => :login
       get '/logout' => 'devise/sessions#destroy', :as => :logout
       get '/signup' => 'devise/registrations#new', :as => :signup
      get '/account/edit'=>'devise/registrations#edit'

  end
  resources :installments
  post  'installments/download' => 'installments#download_files_step'
  post  'installments/end'=> 'installments#instalations_end'
  resources :lic_keys, :only => [:create,:destroy]
  match 'lic_keys/generate'=>'lic_keys#update_key'
  match 'order_programm'=>'lic_requests#request_programm'
  resources :questionnaires
  resources :orders
  resources :line_items
  resources :lic_requests
   root :to => "home#index"
   match '/registrations_now'=>'home#register_now'
   resources :experts, :only=>[:show, :index]
   resources :feedbacks
   resources :materials, :only=>[:show, :index]
   get '/information_pages' =>'pages#index'
   get '/information_pages/:id'=>'pages#show', :as => :information_page 
   get 'information_pages/:page_id/children/:id'=>'children_pages#show'
    get '/programms'=>'materials#index'
    get '/programms/:id'=>'materials#show'
   resources :clients, :only=>[:show, :index]
   resources :programs_features
   get '/library/:id' =>'lib_books#show', :as => :lib_book
   resources :about, :only=>[:index]
   get '/news'=>'posts#index'
   get '/news/:id'=>'posts#show'
   resources :subscribers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
       root to: 'admin/admin_users#index'     
end
