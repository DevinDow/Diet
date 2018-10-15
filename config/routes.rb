Rails.application.routes.draw do

  # Home
  root to: 'home#index'

  # Days & Meals
  get 'today', to: 'days#today'
  resources :days do
    resources :meals, shallow: true, :except => [:index]
  end

end
