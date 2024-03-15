Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: { sessions: 'sessions' }, only: [:create]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get 'user_posts', to: 'posts#show_user_posts', as: 'user_posts'

   root "posts#index"
   resources :posts do
    resources :comments, only: [:create]
  end
end
