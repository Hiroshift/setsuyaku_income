Rails.application.routes.draw do
  devise_for :users
  # Define the root path route ("/")
  root 'home#index'
  # post "new_income", to: "home#create"
end
