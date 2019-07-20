Rails.application.routes.draw do

  # Home
  root to: 'home#index'
  get 'time', to: 'home#time'

  # Days & Meals
  get 'today', to: 'days#today'
  get 'date', to: 'days#date'
  resources :days do
    resources :meals, shallow: true
  end

end
