# Rails.application.routes.draw do
#
#
#
#   # namespace :api do
#   #   namespace :v1 do
#   #     resources :users, only: [:index]
#   #     resources :medicines, only: [:index]
#   #     resources :medicinetouser, only: [:index]
#   #     resources :medics, only: [:index]
#   #     resources :sessions, only: [:create, :destroy]
#   #   end
#   # end
#
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end
#

DBTSRuby::Application.routes.draw do

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'measurements/getmeasurementbyuid/:patient_id', :to => 'measurements#getmeasurementbyuid'
  get 'users/getuserbyid/:user_id', :to => 'users#getuserbyid'
  post 'users/saveuser', :to => 'users#saveuser'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  root to: "home#show"

  namespace :api do
    namespace :v1 do
      resources :users
      resources :medicines
      resources :medics
      resources :measurements
      resources :medicinetouser
    end
  end
end