Rails.application.routes.draw do
  resources :birds, only: [:index, :show]
  # get '/birds' => 'birds#index'
end