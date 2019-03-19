Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index]
      resources :medicines, only: [:index]
      resources :measurements, only: [:index]
      resources :medicinetouser, only: [:index]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end




DBTSRuby::Application.routes.draw do
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
      resources :measurements do
      end
      resources :medicinetouser do
      end

    end
  end

end