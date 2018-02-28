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

  # 收藏餐廳與取消收藏餐廳
  ## POST /restaurant/:id/favorite
  def favorite
    @restaurant = Restaurant.find(params[:id])

    # Rails 會判斷需要的外鍵資訊
    @restaurant.favorites.create!(user: current_user)
    # 上一行結果與 @restaurant.favorites.create!(user_id: current_user.id) 結果一致

    # for top 10 ranking favorites count
    @restaurant.count_favorites

    # 導回上一頁
    redirect_back(fallback_location: root_path)
  end

  ## POST /restaurant/:id/unfavorite
  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    favorites = Favorite.where(restaurant_id: @restaurant.id, user_id: current_user.id)
    # favorites = Favorite.where(restaurant: @restaurant, user: current_user)

    favorites.destroy_all

    # for top 10 ranking favorites count
    @restaurant.count_favorites

    redirect_back(fallback_location: root_path)
  end

  # for TOP 10 人氣餐廳
  ## GET /restaurants/ranking
  def ranking
    # 用 favorites_count 升冪排序，只取前十筆
    @restaurants = Restaurant.order(favorites_count: :desc).first(10)
  end

end
