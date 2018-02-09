class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.all

    # For new or edit Category
    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created."
      redirect_to admin_categories_path
    else
      flash[:notice] = "Category was failed to create."
      @categories = Category.all
      render :index
    end
  end

  def update
    # 因爲這邊沒用 before_action 所以要補。
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Category data was successfully updated."
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "Category was failed to update!"
      @categories = Category.all
      render :index
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:alert] = "Category was successfully deleted."
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
