Karmagrove::Application.routes.draw do

  match 'auth/facebook/callback', to: 'sessions#create'
  match 'auth/facebook/login', to: 'sessions#login'
  # match 'auth/failure', to: redirect('/')
  # match 'signout', to: 'sessions#destroy', as: 'signout'

  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
  #   get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  # end

  # devise_scope :user do
  #   get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  # end

  resources :batch_charities

  resources :batches

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :products do
    resources :purchases
  end

  resources :batches

  resources :batches do
    resources :donations do
      resources :purchases
    end
  end

  match "/batches/:batch_id/donations/:donation_id/purchases/:purchase_id/update" => "purchases#update"

  #"/batches/1/donations/1/purchases/4/update"
  # match 'batch/#{id}/donate' => "batch#donate"

  resources :donations do
    resources :purchases
  end

  root :to => "donations#index"


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  match 'about' => 'about#index'
  match 'karma_coin_facts' => 'about#karma_coin'
  match 'grove' => 'about#grove'

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
