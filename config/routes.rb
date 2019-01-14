Rails.application.routes.draw do
  get 'landing/index'

  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :landing
  resources :home do
    resources :posts
  end
  resources :posts do
      resources :comments
  end
  resources :sessions

  root 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
