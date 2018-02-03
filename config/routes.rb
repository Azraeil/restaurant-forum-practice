Rails.application.routes.draw do
  # 前台 routes
  resources :restaurants, only: [:index, :show]
  root "restaurants#index"

  # 後台 routes
  namespace :admin, path: "akjdhkajsdh" do
    resources :restaurants
    root "restaurants#index"
  end
end
