Rails.application.routes.draw do
  resources :beers, except: [:new, :edit]
end
