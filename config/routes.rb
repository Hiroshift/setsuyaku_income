Rails.application.routes.draw do
  devise_for :users
  # Define the root path route ("/")
  root "application#hello"
end
