class FollowshipsController < ApplicationController
  def create
    @followship = current_user.followships.build(follow_target_id: params[:follow_target_id])

    if @followship.save
      flash[:notice] = "Successfully followed."
      redirect_back(fallback_location: root_path)
    else
      flash[:alert ] = @followship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @followship = current_user.followships.where(follow_target_id: params[:id]).first
    @followship.destroy
    flash[:notice] = "Followship destroyed!"
    redirect_back(fallback_location: root_path)
  end
end
