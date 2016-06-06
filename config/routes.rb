Rails.application.routes.draw do


  get 'registrations/sign_up_params'
    get 'registrations/account_update_params'


  devise_for :users
       root to: "users#search"

       resources :venues

# Displaying search results
        post '/result' => 'venues#result'
        get '/result' => 'venues#result'

# Search engine page
        get '/search' => 'venues#search'



end
