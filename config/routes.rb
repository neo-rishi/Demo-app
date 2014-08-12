Rails.application.routes.draw do

  root 'welcome#index'
  resources :users do
    member do
      get 'follow_unfollow'
      get 'change_password'
      post 'change_password_method'
      get 'update_profile'
      post 'update_profile_method'
    end
    collection do
      get 'follow'
      post 'login'
      get 'signin'
      get 'logout'
      get 'followers'
      get 'followings'
      get 'favourite_show'
      get 'new_messages'
      post 'messages'
    end
  end
  resources :posts, except: [:new] do
    member do
      get 'post_vote_up'
      get 'post_vote_down'
      get 'favourite'
    end
    collection do

    end
    resources :comments, only: [:create]
  end


  resources :profile


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
