Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      resources :fellowships
      resources :calls
      resources :supporters
      resources :circles

      post '/auth', to: 'auth#create'
      post '/signup', to: 'users#create'
      get '/current_user', to: 'auth#verify'
      get '/me', to: 'auth#show'
      delete '/supporters', to: 'supporters#remove'
    end
  end

end
