class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # 新增使用者評論
    @comment = Comment.new
  end

  # for 所有餐廳的最新動態
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  # for 每間餐廳的 dashboard (儀表板)
  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end
end
