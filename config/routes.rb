Rails.application.routes.draw do
  resources :users

  resources :rooms
  namespace "api", :defaults => {:format => "json"} do
    post '/showdata', to: 'users#showdata'
    post '/rooms/show/:id', to: 'rooms#show'
    post '/rooms/create/:id', to: 'rooms#create'
    post '/users/show', to: 'users#show'
    post '/users/showall/:id', to: 'users#showall'
    post '/checkin/:user_id/:room_id', to: 'users#checkin'
    post '/checkout/:user_id', to: 'users#checkout'
    post '/updatemac/:user_id/:room_id/:bssid', to: 'users#updatemac'
    post '/updatetype/:user_id/:room_id/:type', to: 'users#updatetype'
    post '/joinroom/:user_id/:room_id', to: 'users#join'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
