Rails.application.routes.draw do




  devise_for :users

       root to: "venues#index"

       resources :venues

       get '/results/:venueID' => 'venue#show'


end
