Rails.application.routes.draw do
  namespace :api do
    resources :beers, except: [:new, :edit]
  end
end

# new/edit routes are server side on both forms
