class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # @restaurants = Restaurant.all
    # use Kaminari
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant was successfully created."
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "Restaurant was failed to create!"
      render :new
    end
  end

  def show
    # 將此段程式碼另外宣告成 private method : find_restaurant
    # @restaurant = Restaurant.find(params[:id])
  end

  def edit

  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "Restaurant data was successfully updated."
      redirect_to admin_restaurant_path(@restaurant.id)
    else
      flash.now[:alert] = "Restaurant was failed to update!"
      render :edit
    end
  end

  def destroy
    flash[:alert] = "#{@restaurant.name} was deleted!"
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
