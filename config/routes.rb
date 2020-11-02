Rails.application.routes.draw do
  resources :twitts, only: :index
end
