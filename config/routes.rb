Rails.application.routes.draw do
  devise_for :users
  # 前台 routes
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end

  root "restaurants#index"

  resources :categories, only: [:show]

  # 後台 routes
  namespace :admin, path: "akjdhkajsdh" do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
