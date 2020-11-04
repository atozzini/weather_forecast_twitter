Rails.application.routes.draw do
  resources :twitts, only: :post do
    collection do
      post :twittar
    end
  end
end
