class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    # 找出該分類底下的餐廳
    @restaurants = @category.restaurants.page(params[:page]).per(9)
  end
end
