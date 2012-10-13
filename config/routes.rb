Omakase::Application.routes.draw do
  root :to => 'home#index'
  resources :products, :except => [:new, :create, :index]
  match '/upload' => 'products#create', :via => :post
  match '/upload' => 'products#new'
  resources :users, :except => :destroy
  match '/images/uploads/*path' => 'gridfs#serve'
  match '/admin' => 'admin#index'
  match '/login' => 'admin#login', :via => :post
  match '/login' => 'admin#loggingIn'
  match '/setup' => 'settings#create', :via => :post
  match '/setup' => 'settings#new'
  match '/setup/edit' => 'settings#update', :via => :post
  match '/setup/edit' => 'settings#edit'
  match '/logout' => 'admin#logout'
  match '/products/:id/featured' => 'products#makeFeatured', :via => :put
  match '/products/:id/featured' => 'products#removeFeatured', :via => :delete
  match '/products/:id/display' => 'products#display', :via => :put

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
