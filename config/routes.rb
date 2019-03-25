Rails.application.routes.draw do



  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :medicines, only: [:index]
      resources :measurements, only: [:index]
      resources :medicinetouser, only: [:index]
      resources :medics, only: [:index]
      resources :sessions, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end




DBTSRuby::Application.routes.draw do

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  root to: "home#show"

  namespace :api do
    namespace :v1 do
      resources :users do
      end
      resources :medicines do
      end
      resources :medics do
      end
      resources :measurements do
        get 'getmeasurementsbyuid', on: :collection
      end
      resources :medicinetouser do
      end
    end
  end
end