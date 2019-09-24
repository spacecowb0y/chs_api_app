Rails.application.routes.draw do
  get 'stats/index'
  get '/stats/:id', to: 'stats#show'

  resources :readings
  resources :thermostats
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
