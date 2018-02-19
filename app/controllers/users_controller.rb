class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def show
    # find_user
  end

  def edit
    # find_user

    # 讓使用者無法進入其他使用者的編輯頁面
    if @user == current_user

    else
      redirect_to user_path(@user.id)
    end
  end

  def update
    # find_user
    if @user.update(user_params)
      flash[:notice] = "User data was successfully updated."
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "User was failed to update!"
      render :edit
    end
  end

  private
  # for before_action
  def find_user
    @user = User.find(params[:id])
    return @user
  end

  # for strong parameters
  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end
end
