Visitka::Application.routes.draw do
  devise_for :users
  devise_scope :user do
      match '/account'=>'users#account'
      get '/login' => 'devise/sessions#new', :as => :login
      get '/logout' => 'devise/sessions#destroy', :as => :logout
      get '/signup' => 'devise/registrations#new', :as => :signup
      get '/account/edit'=>'devise/registrations#edit'

  end
   match 'order_programm'=>'lic_requests#request_programm'
  resources :accounts
  resources :questionnaires
  resources :orders
  resources :line_items
  resources :lic_requests
   root :to => "home#index"
   match '/registrations_now'=>'home#register_now'
   resources :experts, :only=>[:show, :index]
   resources :feedbacks
   resources :materials, :only=>[:show, :index]
   match '/information_pages' =>'pages#index'
   match '/information_pages/:id'=>'pages#show'
   match 'information_pages/:page_id/children/:id'=>'children_pages#show'
    match '/programms'=>'materials#index'
    match '/programms/:id'=>'materials#show'
   resources :clients, :only=>[:show, :index]
   resources :programs_features
   match '/library/:id' =>'lib_books#show'
   resources :about, :only=>[:index]
   match '/news'=>'posts#index'
   match '/news/:id'=>'posts#show'
   resources :subscribers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
       root to: 'admin/admin_users#index' 
       
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
    
end
