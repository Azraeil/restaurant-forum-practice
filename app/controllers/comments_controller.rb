class CommentsController < ApplicationController
  def create
    # 帶入 :restaurant_id 確認餐廳物件，觀察 rails routes restaurant_comments 的 URI pattern
    @restaurant = Restaurant.find(params[:restaurant_id])

    # Strong Parameters 驗證
    @comment = @restaurant.comments.build(comment_params)

    # 取得另一個 FK：讓現在登入的使用者爲評論的使用者
    @comment.user = current_user
    @comment.save!

    redirect_to restaurant_path(@restaurant.id)
  end

  def destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
