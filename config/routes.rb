Rails.application.routes.draw do
  # 透過 devise 實現使用者註冊，登入，管理
  devise_for :users

  # 前台餐廳 routes
  resources :restaurants, only: [:index, :show] do
    # for 餐廳評論
    resources :comments, only: [:create, :destroy]

    # 瀏覽所有餐廳的最新動態
    collection do
      get :feeds
    end

    # 瀏覽個別餐廳的 Dashboard
    member do
      get :dashboard
    end

    # 收藏與取消收藏餐廳功能
    member do
      post :favorite
      post :unfavorite
    end

    # TOP 10 Ranking restaurants
    collection do
      get :ranking
    end
  end

  root "restaurants#index"

  resources :categories, only: [:show]

  resources :users, only: [:show, :edit, :update]

  # 後台 routes
  namespace :admin, path: "akjdhkajsdh" do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
