Rails.application.routes.draw do

  # Home
  root to: 'home#index'

  # Days & Meals
  resources :days do
    resources :meals, shallow: true, :except => [:index]
  end

end
