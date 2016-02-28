Rails.application.routes.draw do

  resources :newsletters
  resources :subscribers do
    member do
      get :unsubscribe
    end
  end


  resources :event_categories
  resources :events do
    resources :build
  end

  resources :build

  devise_for :users

  #Routes just for our lovely admin
  resources :users, only: [:index, :update, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  get 'events/:id/review' => 'events#review', as: :review
  get 'events/:id/unpublish' => 'events#unpublish', as: :unpublish
  get 'calendar/unpublishables' => 'events#unpublishables', as: :unpublishables
  get 'calendar/publishables' => 'events#publishables', as: :publishables
  get 'calendar/permittables' => 'events#permittables', as: :permittables

  get 'newsletter/abonnement' => 'subscribers#new', as: :edit_subscription
  get 'newsletters/:id/review' => 'newsletters#review', as: :review_newsletter
  get 'newsletter/publishables' => 'newsletters#publishables', as: :publishables_newsletter


  #Home route
  root "fullcalendar#index"
  


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

  # Example resource route with con
  get "*any", via: :all, to: "errors#not_found"
end