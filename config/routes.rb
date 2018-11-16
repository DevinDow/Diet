Rails.application.routes.draw do

  # Home
  root to: 'home#index'

  # Days & Meals
  get 'date', to: 'days#date'
  resources :days do
    resources :meals, shallow: true
  end

end
