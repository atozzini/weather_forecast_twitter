Rails.application.routes.draw do
  resources :twitts, only: :index do
    collection do
      post :twittar
    end
  end
end
