Rails.application.routes.draw do

  #Api Definition
      scope module: :api, defaults: { format: :json } do
        scope module: :v1 do

          resources :users, only: [:index, :create]
          resources :medicines, only: [:index, :create]
          resources :medics, only: [:index, :create]
          resources :measurements, only: [:index, :create]
          resources :medicinetouser, only: [:index, :create]

          post 'users/saveuser'                 => 'users#create'
          post 'measurements/save           '   => 'measurements#create'
          post 'medicinse/savemedicines'        => 'medicines#create'
          get  'users/getuserbyid'              => 'users#userbyid'
          get  'measurements/getbyuid'          => 'measurements#getmeasurementbyuid'
        end
      end
    end



# DBTSRuby::Application.routes.draw do
#
#   # Routes for Google authentication
#   get 'auth/:provider/callback', to: 'sessions#create'
#   get 'auth/failure', to: redirect('/')
#
#
#   # resources :sessions, only: [:create, :destroy]
#   # resource :home, only: [:show]
#   # root to: "home#show"
#
#   namespace :api do
#     namespace :v1 do
#       resources :users
#       resources :medicines
#       resources :medics
#       resources :measurements
#       resources :medicinetouser
#
#       get 'signout', to: 'sessions#destroy', as: 'signout'
#       get 'measurements/getmeasurementbyuid/:patient_id', :to => 'measurements#getmeasurementbyuid'
#       # get 'users/getuserbyid/:user_id', :to => 'users#getuserbyid'
#
#       match '/users/getuserbyid/:user_id' => 'users#getuserbyid', via: :get
#       match '/users/create' => 'users#create', via: :post
#
#     end
#   end
# end