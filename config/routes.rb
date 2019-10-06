Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  bet '/birds/:id' => 'birds#show'
end
