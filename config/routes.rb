TippingPointPartners::Application.routes.draw do
  

  



  get "announcements/create"

  get "announcements/destroy"

  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"

#  get "linked_in/index"
  get "linked_in/callback"
  
  resources :users
  
  match "/validate/:token" =>'users#validate', :as => 'validate'
##  validate_users_url(:token => users.validation_token) ??
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :companies
  resources :password_resets
  resources :announcements, only: [:create, :destroy]
  root to: 'pages#home'
  
  match "/home",        to: "pages#home"   
  match '/faqs',        to: 'pages#faqs'
  match '/contact',     to: 'pages#contact'
  match '/me',          to: 'pages#me'
  match '/check_inbox', to: 'pages#check_inbox'
  
  match '/workspace',   to: 'users#index'
  match '/signup',      to: 'users#new'
  match '/edit',        to: 'users#edit'
  
  match '/signin',      to: 'sessions#new'
  match '/signout',     to: 'sessions#destroy', via: :delete
  match '/my_company',  to: 'pages#my_company'
  
  match '/new_company', to: 'companies#new'
  match '/companies',   to: 'companies#index'

  match '/linked_in',    to: 'linked_in#index'
  #match 'new_password_resets', to:'password_resets#new'
  
 
  

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
