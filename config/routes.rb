Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/book-search', to: 'book#index'
      resources :users, only: [:create]
    end
  end
end
