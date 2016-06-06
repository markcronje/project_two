Rails.application.routes.draw do

  devise_for :users
       root to: "home#index"

       resources :venues


        post '/result' => 'venues#result'
        get '/result' => 'venues#result'

        get '/search' => 'venues#search'



end
