class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_target_id: params[:friend_target_id])

    if @friendship.save
      flash[:notice] = "Successfully followed."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_target_id: params[:id]).first
    @friendship.destroy

    flash[:notice] = "Friendship destroyed!"
    redirect_back(fallback_location: root_path)
  end
end
