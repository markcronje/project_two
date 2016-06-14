Rails.application.routes.draw do


  devise_for :users

       root to: "venues#home"

       resources :venues

       get '/results/:venueID' => 'venue#show'

       post '/result' => 'venues#index'
       get '/result' => 'venues#index'


end
