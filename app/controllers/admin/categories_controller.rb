class Admin::CategoriesController < Admin::BaseAdminController
  # find category id before action !
  before_action :find_category, only: [:update, :destroy]

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
    # 有 before_action 先用 id 找 @category

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
    # 有 before_action 先用 id 找 @category
    # 已經設定 dependency，如果 category 底下有關聯的 restaurant，會無法刪除且會有錯誤提示訊息。
    if @category.destroy
      flash[:notice] = "Category was successfully delete!"
    else
      flash[:alert] = @category.errors.full_messages.to_sentence
    end

    # 請注意目前這種刪法，會讓關聯的餐廳資料表顯示異常(缺少餐廳欄位資料)
    # @category.destroy
    # flash[:alert] = "Category was successfully deleted."

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
